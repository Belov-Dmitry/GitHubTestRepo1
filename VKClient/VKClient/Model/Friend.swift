//
//  Friend.swift
//  VKClient
//
//  Created by Dmitry Belov on 17.11.2021.
//


import Foundation
import RealmSwift



// MARK: - FriendsContainer
class FriendsContainer: Object, Codable {
    let response: FriendsResponse

    init(response: FriendsResponse) {
        self.response = response
    }
}

// MARK: - Response
class FriendsResponse: Object, Codable {
    let count: Int
    let items: [Friend]

    init(count: Int, items: [Friend]) {
        self.count = count
        self.items = items
    }
}

// MARK: - Item
class Friend: Object, Codable {
    @objc dynamic var domain: String
    @objc dynamic var id: Int
    @objc dynamic var photo100: String
    @objc dynamic var lastName: String
    @objc dynamic var trackCode: String
    @objc dynamic var firstName: String
    
    enum CodingKeys: String, CodingKey {
        case domain = "0"
        case id = "id"
        case photo100 = "photo_100"
        case lastName = "last_name"
        case trackCode = "track_code"
        case firstName = "first_name"
    }

    init(domain: String, id: Int, photo100: String, lastName: String,  trackCode: String, firstName: String) {
        self.domain = domain
        self.id = id
        self.photo100 = photo100
        self.lastName = lastName
        self.trackCode = trackCode
        self.firstName = firstName
    }
}
