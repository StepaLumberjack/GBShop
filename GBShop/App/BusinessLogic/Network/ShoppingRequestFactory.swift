
import Alamofire

protocol ShoppingRequestFactory {
    
    func getCatalog(
        pageNumber: Int,
        idCategory: Int,
        completionHandler: @escaping (DataResponse<[CatalogResult]>) -> Void)
    
    func getProduct(
        idProduct: Int,
        completionHandler: @escaping (DataResponse<ProductResult>) -> Void)
}
