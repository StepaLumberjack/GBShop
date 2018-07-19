
import XCTest
import Alamofire
import OHHTTPStubs
@testable import GBShop

/**
 Тестирует API поиска списка товаров и конкретного товара, добавления/удаления из корзины, оплаты заказа
 */
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
    
    func testGetCatalog() {
        
        let exp = expectation(description: "")
        
        OHHTTPStubsResponse.stubResponseByPathEnd(pathEnd: "catalogData.json")
        
        var catalog: [CatalogResult]?
        shop.getCatalog(pageNumber: 1, idCategory: 1
        ) { result in
            catalog = result.value
            exp.fulfill()
        }
        wait(for: [exp], timeout: 1)
        XCTAssertNotNil(catalog)
    }
    
    func testGetProduct() {
        
        let exp = expectation(description: "")
        
        OHHTTPStubsResponse.stubResponseByPathEnd(pathEnd: "getGoodById.json")
        
        var userGood: ProductResult?
        shop.getProduct(idProduct: 123
        ) { result in
            userGood = result.value
            exp.fulfill()
        }
        wait(for: [exp], timeout: 1)
        XCTAssertNotNil(userGood)
    }
    
    func testAddToCart() {
        
        let exp = expectation(description: "")
        
        OHHTTPStubsResponse.stubResponseByPathEnd(pathEnd: "addToBasket.json")
        
        var fillingResult: SuccessResult?
        shop.addToCart(idProduct: 123,quantity: 2) {
            result in
            fillingResult = result.value
            exp.fulfill()
        }
        wait(for: [exp], timeout: 1)
        XCTAssertNotNil(fillingResult)
    }
    
    func testRemoveFromCart() {
        
        let exp = expectation(description: "")
        
        OHHTTPStubsResponse.stubResponseByPathEnd(pathEnd: "deleteFromBasket.json")
        
        var clearenceResult: SuccessResult?
        shop.removeFromCart(idProduct: 123) {
            result in
            clearenceResult = result.value
            exp.fulfill()
        }
        wait(for: [exp], timeout: 1)
        XCTAssertNotNil(clearenceResult)
    }
    
    func testPayOrder() {
        
        let exp = expectation(description: "")
        
        OHHTTPStubsResponse.stubResponseByPathEnd(pathEnd: "payOrder.json")
        
        var paymentResult: SuccessResult?
        shop.payOrder(idOrder: 304947) {
            result in
            paymentResult = result.value
            exp.fulfill()
        }
        wait(for: [exp], timeout: 1)
        XCTAssertNotNil(paymentResult)
    }
}
