//
//  ShoppingRequestFactoryTests.swift
//  GBShopTests
//
//  Created by macbookpro on 09.07.2018.
//  Copyright © 2018 macbookpro. All rights reserved.
//

import XCTest
import Alamofire
import OHHTTPStubs
@testable import GBShop

class ShoppingRequestFactoryTests: XCTestCase {
    
    var shop: ShoppingRequestFactory!
    
    override func setUp() {
        super.setUp()
        
        let factory = RequestFactoryMock()
        shop = factory.makeShoppingRequestFatory()
    }
    
    override func tearDown() {
        super.tearDown()
        
        shop = nil
        OHHTTPStubs.removeAllStubs()
    }
    
    func testGetProduct() {
        let exp = expectation(description: "")
        
        stub(condition: isMethodGET() && pathEndsWith("getGoodById.json")) { request in
            let fileUrl = Bundle.main.url(forResource: "getGoodById", withExtension: "json")!
            return OHHTTPStubsResponse(
                fileURL: fileUrl,
                statusCode: 200,
                headers: nil
            )
        }
        
        var userGood: ProductResult?
        shop.getProduct(idProduct: 123
        ) { result in
            userGood = result.value
            exp.fulfill()
        }
        wait(for: [exp], timeout: 1)
        XCTAssertNotNil(userGood)
    }
}
