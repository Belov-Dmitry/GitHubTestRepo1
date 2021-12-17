//
//  Session.swift
//  VKClient
//
//  Created by Dmitry Belov on 09.12.2021.
//

import Foundation

final class Session {
    
    private init() {}
    static let shared = Session() //shared это стандартное название?
        
    var token = ""
    var userId = ""
    var searchText = ""

    
}
