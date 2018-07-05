//
//  User.swift
//  GBShop
//
//  Created by macbookpro on 04.07.2018.
//  Copyright © 2018 macbookpro. All rights reserved.
//

import Foundation

struct RegisterResult {
    let result:Int
    let message: String
    
    enum CodingKeys: String, CodingKey {
        case message = "userMessage"
    }
}

struct LoginResult: Codable {
    let result: Int
    let user: User
}

struct User: Codable {
    let id: Int
    let login: String
    let name: String
    let lastname: String
    
    enum CodingKeys: String, CodingKey {
        case id = "id_user"
        case login = "user_login"
        case name = "user_name"
        case lastname = "user_lastname"
    }
}

