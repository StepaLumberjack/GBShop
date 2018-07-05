//
//  Regist.swift
//  GBShop
//
//  Created by macbookpro on 04.07.2018.
//  Copyright © 2018 macbookpro. All rights reserved.
//

import Alamofire

class Register: AbstractRequestFatory {
    
    let errorParser: AbstractErrorParser
    let sessionManager: SessionManager
    let queue: DispatchQueue?
    let baseUrl = URL(string: "https://raw.githubusercontent.com/GeekBrainsTutorial/online-store-api/master/responses/")!
    
    init(
        errorParser: AbstractErrorParser,
        sessionManager: SessionManager,
        queue: DispatchQueue? = DispatchQueue.global(qos: .utility)) {
        
        self.errorParser = errorParser
        self.sessionManager = sessionManager
        self.queue = queue
    }
}

extension Register: RegisterRequestFactory {
    
    func register(
        id: Int,
        userName: String,
        password: String,
        email: String,
        gender: String,
        creditCard: String,
        bio: String,
        completionHandler: @escaping (DataResponse<RegisterResult>) -> Void) {
        
        let requestModel = Login(baseUrl: baseUrl, login: userName, password: password)
        self.request(reques: requestModel, completionHandler: completionHandler)
        
    }
    
    struct Register: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .get
        //let path: String = "login.json"
        
        let login: String
        let password: String
        
        var parameters: Parameters? {
            return [
                "username": login,
                "password": password
            ]
        }
    }
}
