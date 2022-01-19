//
//  GroupFirebase.swift
//  VKClient
//
//  Created by Dmitry Belov on 19.01.2022.
//
import Foundation
import Firebase

class GroupFirebase {
    
    let groupName: String
    let groupId: Int
    let ref: DatabaseReference?
    
    //для создания объекта
    init(groupName: String, groupId: Int) {
 
        self.ref = nil
        self.groupName = groupName
        self.groupId = groupId
    }
    
    //для получения объекта из Firebase Database
    init?(snapshot: DataSnapshot) {

        guard
            let value = snapshot.value as? [String: Any],
            let groupId = value["groupId"] as? Int,
            let groupName = value["groupName"] as? String else {
                return nil
        }
        
        self.ref = snapshot.ref
        self.groupName = groupName
        self.groupId = groupId
    }
    

    func toAnyObject() -> [String: Any] {
   
        return [
            "groupName": groupName,
            "groupId": groupId
        ]
    }
}
