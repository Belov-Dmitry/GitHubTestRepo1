//
//  Friend.swift
//  VKClient
//
//  Created by Dmitry Belov on 17.11.2021.
//

import Foundation
import RealmSwift

// MARK: - FriendsContainer
class FriendsContainer: Codable {
    let response: FriendsResponse

    init(response: FriendsResponse) {
        self.response = response
    }
}

// MARK: - FriendsResponse
class FriendsResponse: Codable {
    let count: Int
    let items: [Friend]

    init(count: Int, items: [Friend]) {
        self.count = count
        self.items = items
    }
}

// MARK: - Friend
class Friend: Object, Codable {
    @objc dynamic var photo100 = ""
    @objc dynamic var lastName = ""
    @objc dynamic var firstName = ""
   

    enum CodingKeys: String, CodingKey {
        case photo100 = "photo_100"
        case lastName = "last_name"
        case firstName = "first_name"
    }
  
    init(photo100: String, lastName: String, firstName: String) {
        self.photo100 = photo100
        self.lastName = lastName
        self.firstName = firstName
    }
    
    required override init() {
        super.init()
    }
}

    final class FriendsDB {
        
        init() {
            Realm.Configuration.defaultConfiguration = Realm.Configuration(schemaVersion: 4)
    }
        
    func save(_ items: [Friend]) {
        let realm = try! Realm()
        
        try! realm.write {
            realm.add(items)
        }
    }
    
    func fetch() -> Results<Friend> {
        let realm = try! Realm()
        
        let friends: Results<Friend> = realm.objects(Friend.self)
        return friends
    }
    
    func deleteAll() {
        let realm = try! Realm()
        realm.deleteAll()
        }
        
    func delete(_ items: [Friend]) {
        let realm = try! Realm()
        
        try! realm.write {
            realm.delete(items)
    }
}
}

