//
//  RequestFactoryMock.swift
//  GBShopTests
//
//  Created by macbookpro on 08.07.2018.
//  Copyright © 2018 macbookpro. All rights reserved.
//

import Alamofire
import OHHTTPStubs
@testable import GBShop

enum ApiErrorStub: Error {
    case fatalError
}

struct ErrorParserStub: AbstractErrorParser {
    func parse(_ result: Error) -> Error {
        return ApiErrorStub.fatalError
    }
    func parse(response: HTTPURLResponse?, data: Data?, error: Error?) -> Error? {
        return error
    }
}

class RequestFactoryMock {
    
    func makeErrorParser() -> AbstractErrorParser {
        return ErrorParserStub()
    }
    
    lazy var commonSessionManager: SessionManager = {
        let configuration = URLSessionConfiguration.ephemeral
        let manager = SessionManager(configuration: configuration)
        OHHTTPStubs.isEnabled(for: configuration)
        return manager
    }()
    
    let sessionQueue = DispatchQueue.global(qos: .utility)
    
    func makeAuthRequestFatory<T>() -> T! {
        let errorParser = makeErrorParser()
        return Auth(
            errorParser: errorParser,
            sessionManager: commonSessionManager,
            queue: sessionQueue
            ) as? T
    }
    
    func makeProfileRequestFatory<T>() -> T! {
        let errorParser = makeErrorParser()
        return Profile(
            errorParser: errorParser,
            sessionManager: commonSessionManager,
            queue: sessionQueue
            ) as? T
    }
    
    func makeShoppingRequestFatory<T>() -> T! {
        let errorParser = makeErrorParser()
        return Shopping(
            errorParser: errorParser,
            sessionManager: commonSessionManager,
            queue: sessionQueue
            ) as? T
    }
}
