//
//  MyGroupsTableViewController.swift
//  VKClient
//
//  Created by Dmitry Belov on 14.11.2021.
//

import UIKit
import SDWebImage

class MyGroupsTableViewController: UITableViewController {
    
        private var groupsAPI = GroupsAPI()
        private var groups: [Group] = []
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
            
            groupsAPI.getGroups { [weak self] groups in
                guard let self = self else { return }

                self.groups = groups
                self.tableView.reloadData()
            }
        }
        
        
        // MARK: - Table view data source

        override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            
            return groups.count
        }

        override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

            let groups: Group = groups[indexPath.row]

            cell.textLabel?.text = "\(groups.name)"

            if let url = URL(string: groups.photo100) {
                cell.imageView?.sd_setImage(with: url, completed: nil)
            }

            return cell
        }
    }
