
import Alamofire

class Review: BaseRequestFactory, ReviewRequestFactory {
    
    func addReview(idUser: Int, text: String, completionHandler: @escaping (DataResponse<CommentResult>) -> Void) {
        let requestModel = AddComment(baseUrl: baseUrl, idUser: idUser, text: text)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
    func approveReview(idComment: Int, completionHandler: @escaping
        (DataResponse<CommentResult>) -> Void) {
        let requestModel = ApproveComment(baseUrl: baseUrl, idComment: idComment)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
    func removeReview(idComment: Int, completionHandler: @escaping
        (DataResponse<CommentResult>) -> Void) {
        let requestModel = RemoveComment(baseUrl: baseUrl, idComment: idComment)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
}

extension Review {
    
    struct AddComment: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .get
        let path: String = "addReview.json"
        
        let idUser: Int
        let text: String
        
        var parameters: Parameters? {
            return [
                "id_user": idUser,
                "text": text
            ]
        }
    }
    
    struct ApproveComment: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .get
        let path: String = "approveReview.json"
        
        let idComment: Int
        
        var parameters: Parameters? {
            return [
                "id_comment": idComment
            ]
        }
    }
    
    struct RemoveComment: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .get
        let path: String = "removeReview.json"
        
        let idComment: Int
        
        var parameters: Parameters? {
            return [
                "id_comment": idComment
            ]
        }
    }
}
