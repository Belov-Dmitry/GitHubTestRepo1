//
//  Photos.swift
//  VKClient
//
//  Created by Dmitry Belov on 20.12.2021.

import Foundation
import RealmSwift

// MARK: - PhotoContainer
class PhotoContainer: Codable {
    let response: PhotoResponse

    init(response: PhotoResponse) {
        self.response = response
    }
}

// MARK: - PhotoResponse
class PhotoResponse: Codable {
    let count: Int
    let items: [Photos]

    init(count: Int, items: [Photos]) {
        self.count = count
        self.items = items
    }
}

// MARK: - Photos
class Photos: Object, Codable {
    @objc dynamic var id = 0
   
    enum CodingKeys: String, CodingKey {
        case id
    }
    init(id: Int) {
        self.id = id
    }
    required override init() {
        super.init()
    }
}

////MARK: - Size
//class Size: Codable {
//    let width, height: Int
//    let url: String
//    let type: String
//
//    init(width: Int, height: Int, url: String, type: String) {
//        self.width = width
//        self.height = height
//        self.url = url
//        self.type = type
//    }
//}

