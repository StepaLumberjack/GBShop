//
//  ExitRequestFactory.swift
//  GBShop
//
//  Created by macbookpro on 08.07.2018.
//  Copyright © 2018 macbookpro. All rights reserved.
//

import Alamofire

protocol ExitRequestFactory {
    
    func logout(
        id: Int,
        completionHandler: @escaping (DataResponse<LogoutResult>) -> Void)
}
