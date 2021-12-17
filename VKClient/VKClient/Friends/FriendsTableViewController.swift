//
//  FriendsTableViewController.swift
//  VKClient
//
//  Created by Dmitry Belov on 14.11.2021.
//

import UIKit

class FriendsTableViewController: UITableViewController, UISearchBarDelegate {
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        makeNamesList()
        sortCharacterOfNamesAlphabet()
    }

    // MARK: данные друзей
    let friendsList = [
        User(userName: "Морти Смит",
             userAvatar: (UIImage(named: "morti")),
             userPhotos: [UIImage(named: "morti1"), UIImage(named: "morti2"), UIImage(named: "morti")]),
        User(userName: "Рик Санчес",
             userAvatar: (UIImage(named: "rick")),
             userPhotos: [UIImage(named: "rick1"), UIImage(named: "rick2"), UIImage(named: "rick")]),
        User(userName: "Саммер Смит",
             userAvatar: (UIImage(named: "summer")),
             userPhotos: [UIImage(named: "summer1"), UIImage(named: "summer2"), UIImage(named: "summer")])
    ]
    
    var namesListFixed: [String] = [] //эталонный массив с именами для сравнения при поиске
    var namesListModifed: [String] = [] // массив с именами меняется (при поиске) и используется в таблице
    var letersOfNames: [String] = []
    
    // MARK: - functions
    
    // создание массива из имен пользователей
    func makeNamesList() {
        namesListFixed.removeAll()
        for item in 0...(friendsList.count - 1){
            namesListFixed.append(friendsList[item].userName)
        }
        namesListModifed = namesListFixed
    }
    
    // созданием массива из начальных букв имен пользователй по алфавиту
    func sortCharacterOfNamesAlphabet() {
        var letersSet = Set<Character>()
        letersOfNames = [] // обнуляем массив на случай повторного использования
        // создание сета из первых букв имени, чтобы не было повторов
        for name in namesListModifed {
            letersSet.insert(name[name.startIndex])
        }
        // заполнение массива строк из букв имен
        for leter in letersSet.sorted() {
            letersOfNames.append(String(leter))
        }
    }
    
    func getNameFriendForCell(_ indexPath: IndexPath) -> String {
        var namesRows = [String]()
        for name in namesListModifed.sorted() {
            if letersOfNames[indexPath.section].contains(name.first!) {
                namesRows.append(name)
            }
        }
        return namesRows[indexPath.row]
    }
    
    func getAvatarFriendForCell(_ indexPath: IndexPath) -> UIImage? {
        for friend in friendsList {
            let namesRows = getNameFriendForCell(indexPath)
            if friend.userName.contains(namesRows) {
                return friend.userAvatar
            }
        }
        return nil
    }
    
    func getPhotosFriend(_ indexPath: IndexPath) -> [UIImage?] {
        var photos = [UIImage?]()
        for friend in friendsList {
            let namesRows = getNameFriendForCell(indexPath)
            if friend.userName.contains(namesRows) {
                photos.append(contentsOf: friend.userPhotos)
            }
        }
        return photos
    }
    

    
    // MARK: - SearchBar
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        namesListModifed = searchText.isEmpty ? namesListFixed : namesListFixed.filter { (item: String) -> Bool in
            return item.range(of: searchText, options: .caseInsensitive, range: nil, locale: nil) != nil
        }
        sortCharacterOfNamesAlphabet()
        tableView.reloadData()
    }
    // отмена поиска (через кнопку Cancel)
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        self.searchBar.showsCancelButton = true // показыть кнопку Cancel
    }
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.showsCancelButton = false // скрыть кнопку Cancel
        searchBar.text = nil
        makeNamesList() // возвращаем массив имен
        sortCharacterOfNamesAlphabet()  // создаем заново массив заглавных букв для хедера
        tableView.reloadData() //обновить таблицу
        searchBar.resignFirstResponder() // скрыть клавиатуру
    }
    
    // MARK: - Table view data source

    //количество секций
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return letersOfNames.count
    }
    
    // настройка хедера ячеек и добавление букв в него
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = UIView()
        header.backgroundColor = UIColor.lightGray.withAlphaComponent(0.2) // прозрачность только хедера
        
        let leter: UILabel = UILabel(frame: CGRect(x: 30, y: 5, width: 20, height: 20))
        leter.textColor = UIColor.black.withAlphaComponent(0.5)  // прозрачность только надписи
        leter.text = letersOfNames[section]
        leter.font = UIFont.systemFont(ofSize: 15, weight: UIFont.Weight.light)
        header.addSubview(leter)
        
        return header
    }
    
    // список букв для навигации (справа контрол)
    override func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return letersOfNames
    }
    
    //количество ячеек
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var countOfRows = 0
        // сравниваем массив букв и заглавные буквы каждого имени, выводим количество ячеек в соотвествии именам на отдельную букву
        for name in namesListModifed {
            if letersOfNames[section].contains(name.first!) {
                countOfRows += 1
            }
        }
        return countOfRows
    }

    //заполнение ячеек
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "FriendsTableViewCell", for: indexPath) as? FriendsTableViewCell
        else {return UITableViewCell()
        }
        
        cell.friendsName.text = getNameFriendForCell(indexPath)
        cell.friendsImage.avatarImage.image = getAvatarFriendForCell(indexPath)
        
        return cell
    }
    


    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showFriendFoto"{
            guard let fotoFriends = segue.destination as? FriendsCollectionViewController else {return}
            
            if let indexPath = tableView.indexPathForSelectedRow {
                fotoFriends.title = getNameFriendForCell(indexPath) //тайтл экрана (имя пользователя)
                fotoFriends.collectionPhotos = getPhotosFriend(indexPath) // все фотки пользователя
        }
   }

}
}
