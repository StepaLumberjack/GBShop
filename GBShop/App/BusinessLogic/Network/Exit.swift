//
//  Exit.swift
//  GBShop
//
//  Created by macbookpro on 08.07.2018.
//  Copyright © 2018 macbookpro. All rights reserved.
//

import Alamofire

class Exit: AbstractRequestFatory {
    
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

extension Exit: ExitRequestFactory {
    
    func logout(
        id: Int,
        completionHandler: @escaping (DataResponse<LogoutResult>) -> Void) {
        
        let requestModel = Logout(baseUrl: baseUrl, id: id)
        self.request(reques: requestModel, completionHandler: completionHandler)
        
    }
    
    struct Logout: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .get
        let path: String = "logout.json"
        
        let id: Int
        
        var parameters: Parameters? {
            return [
                "id_iser": id
            ]
        }
    }
}
