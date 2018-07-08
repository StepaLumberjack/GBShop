//
//  RequestFactoryMock.swift
//  GBShopTests
//
//  Created by macbookpro on 08.07.2018.
//  Copyright © 2018 macbookpro. All rights reserved.
//

import Alamofire

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
}
