//
//  RealmViewController.swift
//  VKClient
//
//  Created by Dmitry Belov on 03.01.2022.
//

import UIKit
import RealmSwift

class RealmViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let friend = Friend()
       
        let realm = try! Realm() //получаем доступ к хранилищу
        
//        do{
        realm.beginWrite() //начинаем изменять хранилище
        realm.add(friend) //кладем все объекты класса в хранилище
        try! realm.commitWrite() //завершаем изменения хранилища
            
//        } catch {
//            print(error) //если ошибка, выводим на экран
//        }
        print(realm.configuration.fileURL)
        
        let friends = realm.objects(Friend.self)
 //       friends.forEach{_ in }
        
        realm.beginWrite()
        realm.add(friend)
        try! realm.commitWrite()
    }
    

}
