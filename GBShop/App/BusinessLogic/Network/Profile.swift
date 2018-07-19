
import Alamofire

/**
 Управляет профилем пользователя
 */
class Profile: BaseRequestFactory, ProfileRequestFactory {
    
    func dataChange(userData: UserData, completionHandler: @escaping (DataResponse<DataChangeResult>) -> Void) {
        let requestModel = Profile(baseUrl: baseUrl, userData: userData)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
}

// MARK: - Profile alteration request router
extension Profile {
    
    struct Profile: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .get
        let path: String = "changeUserData.json"
        
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
