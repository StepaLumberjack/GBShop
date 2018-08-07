
import XCTest

class GBShopUITests: XCTestCase {
    
    var app: XCUIApplication!
    
    override func setUp() {
        super.setUp()
        
        continueAfterFailure = false
        
        app = XCUIApplication()
        app.launch()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testAuth() {
        let loginTextField = app.textFields["loginTextField"]
        let passwordTextField = app.textFields["passwordTextField"]
        
        loginTextField.tap()
        loginTextField.typeText("Somebody")
        
        passwordTextField.tap()
        passwordTextField.typeText("mypassword")
        
        app.buttons["Войти"].tap()
    }
    
}
