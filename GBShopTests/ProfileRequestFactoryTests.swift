
import XCTest
import Alamofire
import OHHTTPStubs
@testable import GBShop

/**
 Тестирует API управления профилем пользователя
 */
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
        
        OHHTTPStubsResponse.stubResponseByPathEnd(pathEnd: "changeUserData.json")
        
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
