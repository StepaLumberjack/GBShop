
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
    
    func testLogin() {
        let exp = expectation(description: "")
        
        OHHTTPStubsResponse.stubResponseByPathEnd(pathEnd: "login.json")
        
        var userSession: LoginResult?
        auth.login(userName: "asdasd",
                   password: "asdasd"
        ) { result in
            userSession = result.value
            exp.fulfill()
        }
        wait(for: [exp], timeout: 1)
        XCTAssertNotNil(userSession)
    }
    
    func testLogout() {
        let exp = expectation(description: "")
        
        OHHTTPStubsResponse.stubResponseByPathEnd(pathEnd: "logout.json")
        
        var userSession: LogoutResult?
        auth.logout()
            { result in
            userSession = result.value
            exp.fulfill()
        }
        wait(for: [exp], timeout: 1)
        XCTAssertNotNil(userSession)
    }
    
    func testSignup() {
        let exp = expectation(description: "")
        
        OHHTTPStubsResponse.stubResponseByPathEnd(pathEnd: "registerUser.json")
        
        var userSession: SignupResult?
        let mockUser = UserData(
            id: 123,
            userName: "Somebody",
            password: "mypassword",
            email: "some@some.ru",
            gender: "m",
            creditCard: "9872389-2424-234224-234",
            bio: "This is good! I think I will switch to another language")
        auth.register(userData: mockUser)
            { result in
                userSession = result.value
                exp.fulfill()
        }
        wait(for: [exp], timeout: 1)
        XCTAssertNotNil(userSession)
    }
}
