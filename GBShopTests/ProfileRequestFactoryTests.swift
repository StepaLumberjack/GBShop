//
//  ProfileRequestFactoryTests.swift
//  GBShopTests
//
//  Created by macbookpro on 09.07.2018.
//  Copyright © 2018 macbookpro. All rights reserved.
//

import XCTest
import Alamofire
import OHHTTPStubs
@testable import GBShop

class ProfileRequestFactoryTests: XCTestCase {
    
    var profile: ProfileRequestFactory!
    
    override func setUp() {
        super.setUp()
        
        let factory = RequestFactoryMock()
        profile = factory.makeProfileRequestFatory()
    }
    
    override func tearDown() {
        super.tearDown()
        
        profile = nil
        OHHTTPStubs.removeAllStubs()
    }
    
    func testDataChange() {
        let exp = expectation(description: "")
        
        stub(condition: isMethodGET() && pathEndsWith("changeUserData.json")) { request in
            let fileUrl = Bundle.main.url(forResource: "changeUserData", withExtension: "json")!
            return OHHTTPStubsResponse(
                fileURL: fileUrl,
                statusCode: 200,
                headers: nil
            )
        }
        
        var userSession: DataChangeResult?
        let mockUser = UserData(
            id: 123,
            userName: "Somebody",
            password: "mypassword",
            email: "some@some.ru",
            gender: "m",
            creditCard: "9872389-2424-234224-234",
            bio: "This is good! I think I will switch to another language")
        profile.dataChange(userData: mockUser
        ) { result in
            userSession = result.value
            exp.fulfill()
        }
        wait(for: [exp], timeout: 1)
        XCTAssertNotNil(userSession)
    }
}
