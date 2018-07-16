
import Alamofire

protocol ReviewRequestFactory {
    
    func addReview(
        idUser: Int,
        text: String,
        completionHandler: @escaping (DataResponse<CommentResult>) -> Void)
    
    func approveReview(
        idComment: Int,
        completionHandler: @escaping (DataResponse<CommentResult>) -> Void)
    
    func removeReview(
        idComment: Int,
        completionHandler: @escaping (DataResponse<CommentResult>) -> Void)
}
