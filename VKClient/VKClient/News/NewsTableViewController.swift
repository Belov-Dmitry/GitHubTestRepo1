//
//  NewsTableViewController.swift
//  VKClient
//
//  Created by Dmitry Belov on 02.12.2021.
//

import UIKit

class NewsTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    // MARK: - Данные
    
    var newsList = [
        PostNewsStruct(avatar: UIImage(named: "NewsMaker1"),
                       name: "Пинки-репортер",
                       date: "29.08.2009",
                       textNews: "Компания лосей, объевшихся гниющих яблок, заблокировали жителю шведского острова Ингарё проход в его собственный дом, пишет The Local. Животные стояли у входа в помещение и вели себя агрессивно, так что мужчина не мог согнать их с участка. Тогда он обратился в полицию.",
                       textImage: UIImage(named: "news1")),
        PostNewsStruct(avatar: UIImage(named: "NewsMaker2"),
                       name: "Желтый чувак",
                       date: "20.03.2017",
                       textNews: "Легендарный центровой Национальной баскетбольной ассоциации (НБА) Шакил О'Нил сомневается в том, что Земля круглая. С разоблачающим заявлением бывший спорстмен выступил в прямом эфире интернет-радио Рodbay.fm, передает NEWSru.",
                       textImage: UIImage(named: "news2")),
        PostNewsStruct(avatar: UIImage(named: "NewsMaker3"),
                       name: "Квадратные штаны - News",
                       date: "13.05.2020",
                       textNews: "В дополнение к тому, когда комета сталкивается с Землей или одновременно извергаются массивные вулканы, одна из наиболее часто обсуждаемых теорий о том, как закончится наш мир, — это вспышка вируса зомби, которая быстро заразит все население.",
                       textImage: UIImage(named: "news3"))
    ]

    // MARK: - Table view data source



    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newsList.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NewsCell", for: indexPath) as! NewsTableViewCell
      

        cell.avatarUserNews.avatarImage.image = newsList[indexPath.row].avatar
        cell.nameUserNews.text = newsList[indexPath.row].name
        
        cell.dateNews.text = newsList[indexPath.row].date
        cell.dateNews.font = UIFont.systemFont(ofSize: 12, weight: UIFont.Weight.light)
        cell.dateNews.textColor = UIColor.blue.withAlphaComponent(0.7)
        
        cell.textNews.text = newsList[indexPath.row].textNews
        cell.textNews.numberOfLines = 0
        
        cell.imageNews.image = newsList[indexPath.row].textImage
        cell.imageNews.contentMode = .scaleAspectFill
        
        
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
