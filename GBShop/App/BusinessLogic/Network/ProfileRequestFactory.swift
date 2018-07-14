
import Alamofire

protocol ProfileRequestFactory{
    
    func dataChange(userData: UserData,
                       completionHandler: @escaping (DataResponse<DataChangeResult>) -> Void)
    
}
