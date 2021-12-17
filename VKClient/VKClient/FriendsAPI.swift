//
//  FriendsAPI.swift
//  VKClient
//
//  Created by Dmitry Belov on 16.12.2021.
//

import Foundation
import Alamofire


struct Friend {
    
    var name = "Pony"
}

final class FriendsAPI {
    
    let baseUrl = "https://api.vk.com/method"
    let userId =  Session.shared.userId
    let accessToken = Session.shared.token
    let version = "5.131"
    let searchText = Session.shared.searchText
    
//MARK: получение списка друзей
    func getFriends(completion: @escaping([Friend])->()) {
        
        let path = "/friends.get"
        let url = baseUrl + path
        
        let params: [String: String] = [
            "user_id": userId,
            "order": "name",
            "count": "50",
            "fields": "photo_100, photo_50, city, domain",
            "access_token": accessToken,
            "v": version
        ]
        
        AF.request(url, method: .get, parameters: params).responseJSON { response in
            
            print(response.result)
        }
    }
    
 //MARK: получение фотографий человека
    func getPhoto(completion: @escaping([Friend])->()) {
        
        let path = "/photos.getAll"
        let url = baseUrl + path
        
        let params: [String: String] = [
            "user_id": userId,
            "order": "name",
            "count": "50",
            "fields": "photo_100, photo_50, city, domain",
            "access_token": accessToken,
            "v": version
        ]
        
        AF.request(url, method: .get, parameters: params).responseJSON { response in
            
            print(response.result)
        }
    }
    
//MARK: получение групп человека
       func getGroups(completion: @escaping([Friend])->()) {
           
           let path = "/groups.get"
           let url = baseUrl + path
           
           let params: [String: String] = [
               "user_id": userId,
               "order": "name",
               "count": "50",
               "fields": "photo_100, photo_50, city, domain",
               "access_token": accessToken,
               "v": version
           ]
           
           AF.request(url, method: .get, parameters: params).responseJSON { response in
               
               print(response.result)
           }
       }
//MARK: поиск групп
           func searchGroups(completion: @escaping([Friend])->()) {
               
               let path = "/groups.search"
               let url = baseUrl + path
               
               let params: [String: String] = [
                "q": searchText,
                   "user_id": userId,
                   "order": "name",
                   "count": "50",
                   "fields": "photo_100, photo_50, city, domain",
                   "access_token": accessToken,
                   "v": version
               ]
               
               AF.request(url, method: .get, parameters: params).responseJSON { response in
                   
                   print(response.result)
               }
           }
}

