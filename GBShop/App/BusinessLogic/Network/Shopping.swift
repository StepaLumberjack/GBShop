
import Alamofire

/**
 Управляет процессом поиска и покупки товара
 */
class Shopping: BaseRequestFactory, ShoppingRequestFactory {

    func getCatalog(pageNumber: Int, idCategory: Int, completionHandler: @escaping (DataResponse<[CatalogResult]>) -> Void) {
        let requestModel = Catalog(baseUrl: baseUrl, pageNumber: pageNumber, idCategory: idCategory)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
    
    func getProduct(idProduct: Int, completionHandler: @escaping
        (DataResponse<ProductResult>) -> Void) {
        let requestModel = Product(baseUrl: baseUrl, idProduct: idProduct)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
}

extension Shopping {
    
    // MARK: - List of products request router
    struct Catalog: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .get
        let path: String = "catalogData.json"
        
        let pageNumber: Int
        let idCategory: Int
        
        var parameters: Parameters? {
            return [
                "page_number": pageNumber,
                "id_category": idCategory
            ]
        }
    }
    
    // MARK: - Certain product request router
    struct Product: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .get
        let path: String = "getGoodById.json"
        
        let idProduct: Int
        
        var parameters: Parameters? {
            return [
                "id_product": idProduct
            ]
        }
    }
}
