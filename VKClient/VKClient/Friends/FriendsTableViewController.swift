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
    private var friends: Results<Friend>?
    private var friendsDB = FriendsDB()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        
        friendsAPI.getFriends { [weak self] friends in
            guard let self = self else { return }

//            self.friends = friends
            self.friendsDB.save(friends)
            self.friends = self.friendsDB.fetch()
            
            self.tableView.reloadData()
        }
    }
    
    
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            
        return friends?.count ?? 0
        }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

        let friend = friends?[indexPath.row]
        
        cell.textLabel?.text = "\(friend!.firstName) \(friend!.lastName)"
        
        
        if let url = URL(string: friend?.photo100 ?? "") {
            cell.imageView?.sd_setImage(with: url, completed: nil)
        }

        return cell
    }
    
    
    
}
