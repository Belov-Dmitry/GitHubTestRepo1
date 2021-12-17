//
//  AllGroupsTableViewController.swift
//  VKClient
//
//  Created by Dmitry Belov on 14.11.2021.
//

import UIKit

class AllGroupsTableViewController: UITableViewController {
    
    var allGroups = [
        Group(groupName: "Котизм",
              groupAvatar: UIImage(named: "group_cat"),
              groupPhotos: [UIImage(named: "group_cat1"), UIImage(named: "group_cat2"), UIImage(named: "group_cat3")]),
        Group(groupName: "Страдающее средневековье",
              groupAvatar: UIImage(named: "group_sred"),
              groupPhotos: [UIImage(named: "group_sred1"), UIImage(named: "group_sred2"), UIImage(named: "group_sred3")]),
        Group(groupName: "The Swift Developers",
              groupAvatar: UIImage(named: "group_swift"),
              groupPhotos: [UIImage(named: "group_swift1"), UIImage(named: "group_swift2"), UIImage(named: "group_swift3")])
]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return allGroups.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "AllGroupsTableCell", for: indexPath) as? AllGroupsTableViewCell else {return UITableViewCell() }

        cell.allGroupsLabel.text = allGroups[indexPath.row].groupName
        cell.allGroupsImage.avatarImage.image = allGroups[indexPath.row].groupAvatar
        

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
