//
//  PhotoAPI.swift
//  VKClient
//
//  Created by Dmitry Belov on 20.12.2021.
//

import Foundation
import Alamofire

final class PhotosAPI {
    
    let baseUrl = "https://api.vk.com/method"
    let userId =  Session.shared.userId
    let accessToken = Session.shared.token
    let version = "5.131"
    let searchText = Session.shared.searchText
    
//MARK: получение списка групп пользователя
    func getPhotos(completion: @escaping([Photos])->()) {
        
        let path = "/photos.getAll"
        let url = baseUrl + path
        
        let params: [String: String] = [
            "owner_id": userId,
            "count": "5",
            "extended": "1",
            "access_token": accessToken,
            "v": version
        ]
        
        AF.request(url, method: .get, parameters: params).responseJSON { response in
            
            print(response.data?.prettyJSON)

            
            guard let jsonData = response.data else {return}
            
            do {
               let photoContainer = try JSONDecoder().decode(PhotoContainer.self, from: jsonData)

                let photos = photoContainer.response.items

                completion(photos)
            } catch {
                print(error)
            }
            
        }
    }
    
 
}


