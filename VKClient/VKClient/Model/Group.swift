//
//  Group.swift
//  VKClient
//
//  Created by Dmitry Belov on 17.11.2021.
//

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? newJSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation
import RealmSwift

// MARK: - GroupsContainer
class GroupsContainer: Codable {
    let response: GroupsResponse

    init(response: GroupsResponse) {
        self.response = response
    }
}

// MARK: - GroupResponse
class GroupsResponse: Codable {
    let count: Int
    let items: [Group]

    init(count: Int, items: [Group]) {
        self.count = count
        self.items = items
    }
}

// MARK: - Group
class Group: Object, Codable {
    @objc dynamic var photo100 = ""
    @objc dynamic var name = ""
    //@objc dynamic var id: Int = 0

    enum CodingKeys: String, CodingKey {
        case photo100 = "photo_100"
        case name
        //case id
    }

    
    init(photo100: String, name: String) {
        self.photo100 = photo100
        self.name = name
        //self.id = id
    }
    
    required override init() {
        super.init()
    }
}
    final class GroupDB {
        
        init() {
            Realm.Configuration.defaultConfiguration = Realm.Configuration(schemaVersion: 4)
    }
        
    func save(_ items: [Group]) {
        let realm = try! Realm()
        
        try! realm.write {
            realm.add(items)
        }
    }
    
    func fetch() -> Results<Group> {
        let realm = try! Realm()
        
        let group: Results<Group> = realm.objects(Group.self)
        return group
    }
    
    func deleteAll() {
        let realm = try! Realm()
        realm.deleteAll()
        }
        
    func delete(_ items: [Group]) {
        let realm = try! Realm()
        
        try! realm.write {
            realm.delete(items)
    }
}
}



