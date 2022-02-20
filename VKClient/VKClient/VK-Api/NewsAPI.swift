//
//  NewsAPI.swift
//  VKClient
//
//  Created by Dmitry Belov on 14.02.2022.
//

import Foundation
import Alamofire
import SwiftyJSON

final class NewsAPI {
    
    let baseUrl = "https://api.vk.com/method"
    let userId =  Session.shared.userId
    let accessToken = Session.shared.token
    let version = "5.131"
    
    var params: Parameters
    
    init(_ session: Session) {
        self.params = [
            "filters": "post",
            "count": "15",
            "access_token": accessToken,
            "v": version
        ]
    }
    
//MARK: получение списка друзей
    func getNews(_ completion: @escaping(NewsContainer?)->()) {
 
        let path = "/newsfeed.get"
        let url = baseUrl + path
        
//        let params: [String: String] = [
//            "filters": "post",
//            "count": "15",
//            "access_token": accessToken,
//            "v": version
//        ]
        
        AF.request(url, method: .get, parameters: params).responseJSON { response in
            
            print(response.data?.prettyJSON ?? "")
            //print(response.result)
            
            guard let jsonData = response.data else {return}

            let decoder = JSONDecoder()
            let json = JSON(jsonData)
            let dispatchGroup = DispatchGroup()
            
            let vkItemsJSONArr = json["response"]["items"].arrayValue
            let vkProfilesJSONArr = json["response"]["profiles"].arrayValue
            let vkGroupsJSONArr = json["response"]["groups"].arrayValue
            
            var vkItemsArray: [NewsFeed] = []
            var vkProfilesArray: [Profile] = []
            var vkGroupsArray: [NewsGroup] = []
            
            // decoding NewsFeed
            DispatchQueue.global().async(group: dispatchGroup) {
                for (index, items) in vkItemsJSONArr.enumerated() {
                    do {
                        let decodedItem = try decoder.decode(NewsFeed.self, from: items.rawData())
                        vkItemsArray.append(decodedItem)
                    }
                    catch (let errorDecode) {
                        print("NewsFeed decoding error at index \(index), err: \(errorDecode)")
                    }
                }
            }
            
            // decoding groups
            DispatchQueue.global().async(group: dispatchGroup) {
                for (index, groups) in vkGroupsJSONArr.enumerated() {
                    do {
                        let decodedItem = try decoder.decode(NewsGroup.self, from: groups.rawData())
                        vkGroupsArray.append(decodedItem)
                        
                    } catch (let errorDecode) {
                        print("NewsGroup decoding error at index \(index), err: \(errorDecode)")
                    }
                }
            }
            
            // decoding profiles
            DispatchQueue.global().async(group: dispatchGroup) {
                for (index, profiles) in vkProfilesJSONArr.enumerated() {
                    do {
                        let decodedItem = try decoder.decode(Profile.self, from: profiles.rawData())
                        vkProfilesArray.append(decodedItem)
                        
                    } catch (let errorDecode) {
                        print("Profile decoding error at index \(index), err: \(errorDecode)")
                    }
                }
            }
            
            
            dispatchGroup.notify(queue: DispatchQueue.main) {
                let response = NewsResponse(items: vkItemsArray,
                                            groups: vkGroupsArray,
                                            profiles: vkProfilesArray)
                let newsFeed = NewsContainer(response: response)
                completion(newsFeed)
            }

//            do {
//                let newsContainer = try JSONDecoder().decode(NewsContainer.self, from: jsonData)
//                let newsFeed = newsContainer.response.items
//                completion(newsFeed)
//            } catch {
//                print(error)
//            }
        }
    }
}

