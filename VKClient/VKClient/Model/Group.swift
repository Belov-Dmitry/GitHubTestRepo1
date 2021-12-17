//
//  Group.swift
//  VKClient
//
//  Created by Dmitry Belov on 17.11.2021.
//

import UIKit

struct Group: Equatable {
    let groupName: String
    let groupAvatar: UIImage?
    let groupPhotos: [UIImage?]
}
