
import Foundation
import Crashlytics

enum AnalyticsEvent {
    enum LoginMethod: String {
        case fromLoginView
        case fromRegisterView
    }
    
    case login(method: LoginMethod, success: Bool)
    case register(success: Bool)
    case logout
    case viewBasket
    case viewProfile
    case viewCatalog
    case viewProduct
    case addToBasket
}

protocol TrackableMixin {
    func track(_ event: AnalyticsEvent)
}

extension TrackableMixin {
    func track(_ event: AnalyticsEvent) {
        
        switch event {
        case let .login(method, success):
            let success = NSNumber(value: success)
            Answers.logLogin(withMethod: method.rawValue, success: success, customAttributes: nil)
        case .logout:
            Answers.logCustomEvent(withName: "logout", customAttributes: [:])
        case let .register(success):
            let success = NSNumber(value: success)
            Answers.logSignUp(withMethod: "default", success: success, customAttributes: nil)
        case .viewCatalog:
            Answers.logContentView(withName: "Каталог товаров", contentType: "ПК и комплектующие", contentId: nil, customAttributes: nil)
        case .viewProduct:
            Answers.logContentView(withName: "Информация о товаре", contentType: "ПК и комплектующие", contentId: nil, customAttributes: nil)
        case .viewBasket:
            Answers.logContentView(withName: "Корзина", contentType: "ПК и комплектующие", contentId: nil, customAttributes: nil)
        case .viewProfile:
            Answers.logContentView(withName: "Профиль", contentType: "Пользователи", contentId: nil, customAttributes: nil)
        case .addToBasket:
            Answers.logAddToCart(withPrice: nil, currency: "RUB", itemName: nil, itemType: "ПК и комплектующие", itemId: nil, customAttributes: nil)
        }
    }
}

func assertionFailure(
    _message: String,
    file: StaticString = #file,
    line: UInt = #line) {
    
    #if DEBUG
    Swift.assertionFailure(_message, file: file, line: line)
    #else
        Answers.logCustomEvent(
        withName: "AssertionFailure",
        customAttributes: [
            "message": _message,
            "file": file,
            "line": line
        ])
    #endif
}
