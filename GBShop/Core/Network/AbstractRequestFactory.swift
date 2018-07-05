//
//  AbstractRequestFactory.swift
//  GBShop
//
//  Created by macbookpro on 04.07.2018.
//  Copyright © 2018 macbookpro. All rights reserved.
//

import Alamofire

protocol AbstractRequestFatory {
    var errorParser: AbstractErrorParser { get }
    var sessionManager: SessionManager { get }
    var queue: DispatchQueue? { get }
    
    @discardableResult
    func request<T: Decodable>(
        reques: URLRequestConvertible,
        completionHandler: @escaping (DataResponse<T>) -> Void)
        -> DataRequest
}

extension AbstractRequestFatory {
    
    @discardableResult
    public func request<T: Decodable>(
        reques: URLRequestConvertible,
        completionHandler: @escaping (DataResponse<T>) -> Void)
        -> DataRequest {
            return sessionManager
                .request(reques)
                .responseCodable(errorParser: errorParser, queue: queue, completionHandler: completionHandler)
    }
}

