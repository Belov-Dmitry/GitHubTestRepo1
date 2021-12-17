//
//  Lesson2ViewController.swift
//  VKClient
//
//  Created by Dmitry Belov on 16.12.2021.
//

import UIKit
import Alamofire

//временный файл с домашним заданием №2
class Lesson2ViewController: UIViewController {
    var friendsAPI = FriendsAPI()
    var friends: [Friend] = []
    
    @IBOutlet weak var searchGroupTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        }

    //MARK: получение списка друзей
    @IBAction func friendListButton(_ sender: Any) {
        friendsAPI.getFriends { [weak self] friends in
            guard let self = self else {return}
            self.friends = friends
            print(friends)
    }
    }
    //MARK: получение фотографий человека
    @IBAction func friendPhotoButton(_ sender: Any) {
        friendsAPI.getPhoto { [weak self] friends in
            guard let self = self else {return}
            self.friends = friends
            print(friends)
        }
    }
//MARK: получение групп пользователя
    @IBAction func groupListButton(_ sender: Any) {
        friendsAPI.getGroups { [weak self] friends in
            guard let self = self else {return}
            self.friends = friends
            print(friends)
        }
    }
//MARK: поиск групп
    @IBAction func groupSearchButton(_ sender: Any) {
        Session.shared.searchText = searchGroupTextField.text!
        friendsAPI.searchGroups { [weak self] friends in
            guard let self = self else {return}
            self.friends = friends
            print(friends)
            
        }
    }
    

    }
    
        

