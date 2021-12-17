//
//  MyGroupsTableViewController.swift
//  VKClient
//
//  Created by Dmitry Belov on 14.11.2021.
//

import UIKit

class MyGroupsTableViewController: UITableViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    var myGroups = [
        Group(groupName: "The Swift Developers",
              groupAvatar: UIImage(named: "group_swift"),
              groupPhotos: [UIImage(named: "group_swift1"), UIImage(named: "group_swift2"), UIImage(named: "group_swift3")])
]
    
    // MARK: - Table view data source
    
   
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return myGroups.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MyGroupsTableCell", for: indexPath) as? MyGroupsTableViewCell
        else {return UITableViewCell() }

        cell.MyGroupsLabelName.text = myGroups[indexPath.row].groupName
        cell.MyGroupsImage.avatarImage.image = myGroups[indexPath.row].groupAvatar
        return cell
    }
    
    
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            myGroups.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    @IBAction func addGroup(segue: UIStoryboardSegue) {
        // проверка по идентификатору верный ли переход с ячейки
        if segue.identifier == "AddGroup"{
            // ссылка объект на контроллер с которого переход
            guard let allGroupController = segue.source as? AllGroupsTableViewController else { return }
            // проверка индекса ячейки
            if let indexPath = allGroupController.tableView.indexPathForSelectedRow {
                //добавить новой группы в мои группы из общего списка групп
                let newGroup = allGroupController.allGroups[indexPath.row]
                
                // проверка что группа уже в списке (нужен Equatable)
                guard !myGroups.contains(newGroup) else { return }
                myGroups.append(newGroup)
                
                tableView.reloadData()
            }
        }
    
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
