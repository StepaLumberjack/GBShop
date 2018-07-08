//
//  AuthRequestFactory.swift
//  GBShop
//
//  Created by macbookpro on 08.07.2018.
//  Copyright © 2018 macbookpro. All rights reserved.
//

import Alamofire

protocol AuthRequestFactory {
    
    func login(
        userName: String,
        password: String,
        completionHandler: @escaping (DataResponse<LoginResult>) -> Void)
    
    func logout(completionHandler: @escaping (DataResponse<LogoutResult>) -> Void)
    
    func register(userData: UserData,
                  completionHandler: @escaping (DataResponse<SignupResult>) -> Void)
}

