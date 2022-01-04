//
//  MyGroupsTableViewController.swift
//  VKClient
//
//  Created by Dmitry Belov on 14.11.2021.
//

import UIKit
import SDWebImage
import RealmSwift

class MyGroupsTableViewController: UITableViewController {
    
        private var groupsAPI = GroupsAPI()
        private var groupDB = GroupDB()
    
        private var group: Results<Group>?
        private var token: NotificationToken?
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
            
            groupsAPI.getGroups { [weak self] groups in
                guard let self = self else { return }

 //               self.groups = groups
                self.groupDB.save(groups)
                self.group = self.groupDB.fetch()
                
//                self.tableView.reloadData()
                self.token = self.group?.observe(on: .main, { [weak self] changes in
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
            guard let groups = group else {
                return 0
            }
            return groups.count
        }

        override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

            let group = group?[indexPath.row]

            cell.textLabel?.text = "\(group?.name ?? "")"

            if let url = URL(string: group?.photo100 ?? "") {
                cell.imageView?.sd_setImage(with: url, completed: nil)
            }

            return cell
        }
    }
