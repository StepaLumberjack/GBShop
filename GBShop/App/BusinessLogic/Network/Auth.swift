
import Alamofire

/**
 Выполняет авторизацию пользователя на сервере
 */
class Auth: BaseRequestFactory, AuthRequestFactory {
    
    func login(userName: String, password: String, completionHandler: @escaping (DataResponse<LoginResult>) -> Void) {
        let requestModel = Login(baseUrl: baseUrl, login: userName, password: password)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
    
    func logout(completionHandler: @escaping (DataResponse<LogoutResult>) -> Void) {
        let requestModel = Logout(baseUrl: baseUrl)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
    
    func register(userData: UserData, completionHandler: @escaping (DataResponse<SignupResult>) -> Void) {
        let requestModel = Register(baseUrl: baseUrl, userData: userData)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
}

// MARK: - Login request router
extension Auth {
    
    struct Login: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .get
        let path: String = "login.json"
        
        let login: String
        let password: String
        
        var parameters: Parameters? {
            return [
                "username": login,
                "password": password
            ]
        }
    }
}

// MARK: - Register request router
extension Auth {
    
    struct Register: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .get
        let path: String = "registerUser.json"
        
        let userData: UserData
        
        var parameters: Parameters? {
            return [
                "username": userData.userName,
                "password": userData.password,
                "email": userData.email,
                "gender": userData.gender,
                "credit_card": userData.creditCard,
                "bio": userData.bio
            ]
        }
    }
}

// MARK: - Logout request router
extension Auth {
    
    struct Logout: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .get
        let path: String = "logout.json"
        
        var parameters: Parameters? {
            return nil
        }
    }
}


