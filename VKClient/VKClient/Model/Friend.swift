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

// MARK: - Response
class FriendsResponse: Codable {
    let count: Int
    let items: [Friend]

    init(count: Int, items: [Friend]) {
        self.count = count
        self.items = items
    }
}

// MARK: - Item
class Friend: Codable {
    let canAccessClosed: Bool?
    let domain: String
    let id: Int
    let photo100: String
    let lastName: String
    let photo50: String
    let trackCode: String
    let isClosed: Bool?
    let firstName: String
    let deactivated: Deactivated?
    let city: City?

    enum CodingKeys: String, CodingKey {
        case canAccessClosed = "can_access_closed"
        case domain, id
        case photo100 = "photo_100"
        case lastName = "last_name"
        case photo50 = "photo_50"
        case trackCode = "track_code"
        case isClosed = "is_closed"
        case firstName = "first_name"
        case deactivated, city
    }

    init(canAccessClosed: Bool?, domain: String, id: Int, photo100: String, lastName: String, photo50: String, trackCode: String, isClosed: Bool?, firstName: String, deactivated: Deactivated?, city: City?) {
        self.canAccessClosed = canAccessClosed
        self.domain = domain
        self.id = id
        self.photo100 = photo100
        self.lastName = lastName
        self.photo50 = photo50
        self.trackCode = trackCode
        self.isClosed = isClosed
        self.firstName = firstName
        self.deactivated = deactivated
        self.city = city
    }
}

// MARK: - City
class City: Codable {
    let id: Int
    let title: String

    init(id: Int, title: String) {
        self.id = id
        self.title = title
    }
}

enum Deactivated: String, Codable {
    case banned = "banned"
    case deleted = "deleted"
}


