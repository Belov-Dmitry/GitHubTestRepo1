//
//  FriendsTableViewController.swift
//  VKClient
//
//  Created by Dmitry Belov on 14.11.2021.
//

import UIKit
import SDWebImage
import RealmSwift

class FriendsTableViewController: UITableViewController {
 
    private var friendsAPI = FriendsAPI()
    private var friendsDB = FriendsDB()
    
    private var friends: Results<Friend>?
    private var token: NotificationToken?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        
        friendsAPI.getFriends { [weak self] friends in
            guard let self = self else { return }

//            self.friends = friends
            self.friendsDB.save(friends)
            self.friends = self.friendsDB.fetch()
            
//            self.tableView.reloadData()
            self.token = self.friends?.observe(on: .main, { [weak self] changes in
                guard let self = self else { return }
                
                switch changes {
                case .initial:
                    self.tableView.reloadData()
                    
                case .update(_, let deletions, let insertions, let modifications):
                    self.tableView.beginUpdates()
                    self.tableView.insertRows(at: insertions.map({ IndexPath(row: $0, section: 0) }), with: .automatic)
                    self.tableView.deleteRows(at: deletions.map({ IndexPath(row: $0, section: 0)}), with: .automatic)
                    self.tableView.reloadRows(at: modifications.map({ IndexPath(row: $0, section: 0) }), with: .automatic)
                    self.tableView.endUpdates()
                    
                case .error(let error):
                    print("\(error)")
                }
            })
        }
    }
    
    
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let friends = friends else {
            return 0
        }

        return friends.count
        }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

        let friend = friends?[indexPath.row]
        
        cell.textLabel?.text = "\(friend?.firstName ?? "") \(friend?.lastName ?? "")"
        
        if let url = URL(string: friend?.photo100 ?? "") {
            cell.imageView?.load(url: url, completion: { image in
                tableView.reloadRows(at: [indexPath], with: .automatic)
            })
        }
        return cell
    }
}
extension UIImageView {
    func load(url: URL, completion: @escaping (UIImage)->()) {
        
        if let data = try? Data(contentsOf: url) {
            if let image = UIImage(data: data){
                
                self.image = image
                completion(image)
            }
        }
    }
}
