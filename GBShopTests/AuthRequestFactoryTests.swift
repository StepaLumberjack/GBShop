//
//  AuthRequestFactoryTests.swift
//  GBShopTests
//
//  Created by macbookpro on 09.07.2018.
//  Copyright © 2018 macbookpro. All rights reserved.
//

import XCTest
import Alamofire
import OHHTTPStubs
@testable import GBShop

class AuthRequestFactoryTests: XCTestCase {
    
    var auth: AuthRequestFactory!
    
    override func setUp() {
        super.setUp()
        
        let factory = RequestFactoryMock()
        auth = factory.makeAuthRequestFatory()
    }
    
    override func tearDown() {
        super.tearDown()
        
        auth = nil
        OHHTTPStubs.removeAllStubs()
    }
    
    func testAuth() {
        let exp = expectation(description: "")
        
        stub(condition: isMethodGET() && pathEndsWith("login.json")) { request in
            let fileUrl = Bundle.main.url(forResource: "login", withExtension: "json")!
            return OHHTTPStubsResponse(
                fileURL: fileUrl,
                statusCode: 200,
                headers: nil
            )
        }
        
        var user: LoginResult?
        auth.login(userName: "asdasd",
                   password: "asdasd"
        ) { result in
            user = result.value
            exp.fulfill()
        }
        wait(for: [exp], timeout: 1)
        XCTAssertNotNil(user)
    }
    
}
