//
//  Session.swift
//  VKClient
//
//  Created by Dmitry Belov on 09.12.2021.
//

import Foundation
class Session { 
    
    private init() {}
    static let shared = Session() //shared это стандартное название?
        
    var token: String = ""
    var userId: Int = 0

}
