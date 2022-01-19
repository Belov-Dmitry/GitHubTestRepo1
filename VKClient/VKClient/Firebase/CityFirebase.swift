//
//  CityFirebase.swift
//  VKClient
//
//  Created by Dmitry Belov on 19.01.2022.
//

import Foundation
import Firebase

class CityFirebase {
    
    let name: String
    let zipcode: Int
    let ref: DatabaseReference?
    
    //для создания объекта
    init(name: String, zipcode: Int) {
 
        self.ref = nil
        self.name = name
        self.zipcode = zipcode
    }
    
    //для получения объекта из Firebase Database
    init?(snapshot: DataSnapshot) {

        guard
            let value = snapshot.value as? [String: Any],
            let zipcode = value["zipcode"] as? Int,
            let name = value["name"] as? String else {
                return nil
        }
        
        self.ref = snapshot.ref
        self.name = name
        self.zipcode = zipcode
    }
    

    func toAnyObject() -> [String: Any] {
   
        return [
            "name": name,
            "zipcode": zipcode
        ]
    }
}
