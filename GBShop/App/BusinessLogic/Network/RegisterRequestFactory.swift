//
//  RegistRequestFactory.swift
//  GBShop
//
//  Created by macbookpro on 04.07.2018.
//  Copyright © 2018 macbookpro. All rights reserved.
//
import Alamofire

protocol RegisterRequestFactory {
    
    func register(
        id: Int,
        userName: String,
        password: String,
        email: String,
        gender: String,
        creditCard: String,
        bio: String,
        completionHandler: @escaping (DataResponse<RegisterResult>) -> Void)
}
