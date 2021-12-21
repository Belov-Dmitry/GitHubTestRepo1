//
//  Photos.swift
//  VKClient
//
//  Created by Dmitry Belov on 20.12.2021.
//

//   let photoContainer = try? newJSONDecoder().decode(PhotoContainer.self, from: jsonData)

import Foundation

// MARK: - PhotoContainer
struct PhotoContainer: Codable {
    let response: PhotosResponse
}

// MARK: - Response
struct PhotosResponse: Codable {
    let count: Int
    let items: [Photos]
}

// MARK: - Item
struct Photos: Codable {
    let isMember, id: Int
    let photo100: String
    let isAdvertiser, isAdmin: Int
    let photo50, photo200: String
    let type, screenName, name: String
    let isClosed: Int

    enum CodingKeys: String, CodingKey {
        case isMember = "is_member"
        case id
        case photo100 = "photo_100"
        case isAdvertiser = "is_advertiser"
        case isAdmin = "is_admin"
        case photo50 = "photo_50"
        case photo200 = "photo_200"
        case type
        case screenName = "screen_name"
        case name
        case isClosed = "is_closed"
    }
}
