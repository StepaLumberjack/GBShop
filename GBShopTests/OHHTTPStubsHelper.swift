
import OHHTTPStubs
import Foundation

extension OHHTTPStubsResponse {
    
    static func stubResponseByPathEnd(pathEnd: String) {
        let pathEnd = pathEnd
        let resourceArr = pathEnd.split(separator: ".")
        let fileName = String(resourceArr[0])
        let fileExtension = String(resourceArr[1])
        
        stub(condition: isMethodGET() && pathEndsWith(pathEnd)) { request in
            let fileUrl = Bundle.main.url(forResource: fileName, withExtension: fileExtension)!
            return OHHTTPStubsResponse(
                fileURL: fileUrl,
                statusCode: 200,
                headers: nil
            )
        }
    }
}
