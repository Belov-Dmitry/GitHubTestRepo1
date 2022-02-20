//
//  Session.swift
//  VKClient
//
//  Created by Dmitry Belov on 09.12.2021.
//

import Foundation

final class Session {
    
    static let shared = Session()
    
    private init() {}
        
    var token = ""
    var userId = ""
    var searchText = ""

    
}
