
import XCTest
import Alamofire
import OHHTTPStubs
@testable import GBShop

class ReviewRequestFactoryTests: XCTestCase {
    
    var review: ReviewRequestFactory!
    
    override func setUp() {
        super.setUp()
        
        let factory = RequestFactoryMock()
        review = factory.makeReviewRequestFatory()
    }
    
    override func tearDown() {
        super.tearDown()
        
        review = nil
        OHHTTPStubs.removeAllStubs()
    }
    
    func testAddReview() {
        let exp = expectation(description: "")
        
        OHHTTPStubsResponse.stubResponseByPathEnd(pathEnd: "addReview.json")
        
        var commentAdding: CommentResult?
        review.addReview(idUser: 123, text: "Фигня какая-то"
        ) { result in
            commentAdding = result.value
            exp.fulfill()
        }
        wait(for: [exp], timeout: 1)
        XCTAssertNotNil(commentAdding)
    }
    
    func testApproveReview() {
        let exp = expectation(description: "")
        
        OHHTTPStubsResponse.stubResponseByPathEnd(pathEnd: "approveReview.json")
        
        var commentApproval: CommentResult?
        review.approveReview(idComment: 45454
        ) { result in
            commentApproval = result.value
            exp.fulfill()
        }
        wait(for: [exp], timeout: 1)
        XCTAssertNotNil(commentApproval)
    }
    
    func testRemoveReview() {
        let exp = expectation(description: "")
        
        OHHTTPStubsResponse.stubResponseByPathEnd(pathEnd: "removeReview.json")
        
        var reviewRemoval: CommentResult?
        review.removeReview(idComment: 45454
        ) { result in
            reviewRemoval = result.value
            exp.fulfill()
        }
        wait(for: [exp], timeout: 1)
        XCTAssertNotNil(reviewRemoval)
    }
}
