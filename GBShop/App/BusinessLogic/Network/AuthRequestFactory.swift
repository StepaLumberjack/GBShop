
import Alamofire

protocol AuthRequestFactory {
    
    func login(
        userName: String,
        password: String,
        completionHandler: @escaping (DataResponse<LoginResult>) -> Void)
    
    func logout(completionHandler: @escaping (DataResponse<LogoutResult>) -> Void)
    
    func register(userData: UserData,
                  completionHandler: @escaping (DataResponse<SignupResult>) -> Void)
}

