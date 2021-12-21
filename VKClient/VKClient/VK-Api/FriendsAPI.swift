//
//  FriendsAPI.swift
//  VKClient
//
//  Created by Dmitry Belov on 16.12.2021.
//

import Foundation
import Alamofire

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
            "count": "15",
            "fields": "photo_100, photo_50, city, domain",
            "access_token": accessToken,
            "v": version
        ]
        
        AF.request(url, method: .get, parameters: params).responseJSON { response in
            
            print(response.data?.prettyJSON)
            //print(response.result)
            
            guard let jsonData = response.data else {return}
            
            do {
                let friendsContainer = try JSONDecoder().decode(FriendsContainer.self, from: jsonData)
                
                let friends = friendsContainer.response.items
                
                completion(friends)
            } catch {
                print(error)
            }
            
        }
    }
    
 
}

