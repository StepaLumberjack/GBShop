
import Alamofire

class RequestFactory {
    
    func makeErrorParser() -> AbstractErrorParser {
        return ErrorParser()
    }
    
    lazy var commonSessionManager: SessionManager = {
        let configuration = URLSessionConfiguration.default
        configuration.httpShouldSetCookies = false
        configuration.httpAdditionalHeaders = SessionManager.defaultHTTPHeaders
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
    
    func makeReviewRequestFatory<T>() -> T! {
        let errorParser = makeErrorParser()
        return Review(
            errorParser: errorParser,
            sessionManager: commonSessionManager,
            queue: sessionQueue
            ) as? T
    }
}

