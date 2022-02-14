//
//  NewsFeedTableViewController.swift
//  VKClient
//
//  Created by Dmitry Belov on 01.02.2022.
//

import UIKit


enum PostCellType: Int, CaseIterable {
    case author = 0
    case text
    case photo
    case likeCount
}

class NewsFeedTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    var newsList = [
        NewsFeed(authorPhoto: UIImage(named: "NewsMaker1"),
                 authorName: "Пинки-репортер",
                 dateOfPublication: "29.08.2009",
                 textOfFeed: "Компания лосей, объевшихся гниющих яблок, заблокировали жителю шведского острова Ингарё проход в его собственный дом, пишет The Local. Животные стояли у входа в помещение и вели себя агрессивно, так что мужчина не мог согнать их с участка. Тогда он обратился в полицию.",
                 photoOfFeed: UIImage(named: "news1"),
                 likeCount: 50,
                 commentCount: 235),
        NewsFeed(authorPhoto: UIImage(named: "NewsMaker2"),
                 authorName: "Желтый чувак",
                 dateOfPublication: "20.03.2017",
                 textOfFeed: "Легендарный центровой Национальной баскетбольной ассоциации (НБА) Шакил О'Нил сомневается в том, что Земля круглая. С разоблачающим заявлением бывший спорстмен выступил в прямом эфире интернет-радио Рodbay.fm, передает NEWSru.",
                 photoOfFeed: UIImage(named: "news2"),
                 likeCount: 34,
                 commentCount: 29),
        NewsFeed(authorPhoto: UIImage(named: "NewsMaker3"),
                 authorName: "Квадратные штаны - News",
                 dateOfPublication: "13.05.2020",
                 textOfFeed: "В дополнение к тому, когда комета сталкивается с Землей или одновременно извергаются массивные вулканы, одна из наиболее часто обсуждаемых теорий о том, как закончится наш мир, — это вспышка вируса зомби, которая быстро заразит все население.",
                 photoOfFeed: UIImage(named: "news3"),
                 likeCount: 367,
                 commentCount: 1000)
    ]
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return newsList.count
        print(newsList.count)
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return PostCellType.allCases.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let item = newsList[indexPath.section]
        let postCellType = PostCellType(rawValue: indexPath.row)
        
       switch postCellType {
       case .author:
           let cell = tableView.dequeueReusableCell (withIdentifier: "AuthorOfFeedTableViewCell", for: indexPath) as! AuthorOfFeedTableViewCell
//             cell.config(authorName: item.authorName, authorPhoto: item.authorPhoto)
           cell.authorName.text = item.authorName
           cell.authorPhoto.image = item.authorPhoto
           cell.dateOfPublication.text = item.dateOfPublication
             cell.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: .greatestFiniteMagnitude)
             return cell
           
       case .text:
           let cell = tableView.dequeueReusableCell (withIdentifier: "TextOfFeedTableViewCell", for: indexPath) as! TextOfFeedTableViewCell
//           cell.config(textOfFeed: item.textOfFeed)
           cell.textOfFeed.text = item.textOfFeed
           cell.textOfFeed.numberOfLines = 0
           cell.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: .greatestFiniteMagnitude)
           return cell
        
       case .photo:
           let cell = tableView.dequeueReusableCell(withIdentifier: "PhotoOfFeedTableViewCell") as! PhotoOfFeedTableViewCell
//           cell.config(photoOfFeed: item.newsImage)
           cell.photoOfFeed.image = item.photoOfFeed
           cell.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: .greatestFiniteMagnitude)
           return cell
        
       case .likeCount:
           let cell = tableView.dequeueReusableCell(withIdentifier: "LikeOfFeedTableViewCell") as! LikeOfFeedTableViewCell
//             cell.config(likeCount: Int.random(in: 0...100), commentCount: Int.random(in: 0...100))
           cell.likeCount.text = String(item.likeCount)
           cell.commentCount.text = String(item.commentCount)
           cell.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: .greatestFiniteMagnitude)
           
           return cell
       default:
           return UITableViewCell()
    }
   

  
 

}
}
