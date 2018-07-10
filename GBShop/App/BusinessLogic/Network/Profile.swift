//
//  Exit.swift
//  GBShop
//
//  Created by macbookpro on 08.07.2018.
//  Copyright © 2018 macbookpro. All rights reserved.
//

import Alamofire

class Profile: BaseRequestFactory, ProfileRequestFactory {
    
    func dataChange(userData: UserData, completionHandler: @escaping (DataResponse<DataChangeResult>) -> Void) {
        let requestModel = Profile(baseUrl: baseUrl, userData: userData)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
}

extension Profile {
    struct Profile: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .get
        let path: String = "changeUserData.json"
        
        let userData: UserData
        
        var parameters: Parameters? {
            return [
                "username": userData.userName,
                "password": userData.password,
                "email": userData.email,
                "gender": userData.gender,
                "credit_card": userData.creditCard,
                "bio": userData.bio
            ]
        }
    }
}
