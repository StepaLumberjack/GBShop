
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
    
    func addToCart(idProduct: Int, quantity: Int, completionHandler: @escaping
        (DataResponse<SuccessResult>) -> Void) {
        let requestModel = CartFilling(baseUrl: baseUrl, idProduct: idProduct, quantity: quantity)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
    
    func removeFromCart(idProduct: Int, completionHandler: @escaping
        (DataResponse<SuccessResult>) -> Void) {
        let requestModel = CartClearance(baseUrl: baseUrl, idProduct: idProduct)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
    
    func payOrder(idOrder: Int, completionHandler: @escaping
        (DataResponse<SuccessResult>) -> Void) {
        let requestModel = Payment(baseUrl: baseUrl, idOrder: idOrder)
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
    
    // MARK: - Add to cart request router
    struct CartFilling: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .get
        let path: String = "addToBasket.json"
        
        let idProduct: Int
        let quantity: Int
        
        var parameters: Parameters? {
            return [
                "id_product": idProduct,
                "quantity": quantity
            ]
        }
    }
    
    // MARK: - Remove from cart request router
    struct CartClearance: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .get
        let path: String = "deleteFromBasket.json"
        
        let idProduct: Int
        
        var parameters: Parameters? {
            return [
                "id_product": idProduct
            ]
        }
    }
    
    // MARK: - Payment request router
    struct Payment: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .get
        let path: String = "payOrder.json"
        
        let idOrder: Int
        
        var parameters: Parameters? {
            return [
                "id_order": idOrder
            ]
        }
    }
}
