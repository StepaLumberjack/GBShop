
import Alamofire

protocol ShoppingRequestFactory {
    
    func getCatalog(
        pageNumber: Int,
        idCategory: Int,
        completionHandler: @escaping (DataResponse<[CatalogResult]>) -> Void)
    
    func getProduct(
        idProduct: Int,
        completionHandler: @escaping (DataResponse<ProductResult>) -> Void)
    
    func addToCart(
        idProduct: Int,
        quantity: Int,
        completionHandler: @escaping (DataResponse<SuccessResult>) -> Void)
    
    func removeFromCart(
        idProduct: Int,
        completionHandler: @escaping (DataResponse<SuccessResult>) -> Void)
    
    func payOrder(
        idOrder: Int,
        completionHandler: @escaping (DataResponse<SuccessResult>) -> Void)
    
    func getBasket(
        idUser: Int,
        completionHandler: @escaping (DataResponse<BasketResult>) -> Void)
}
