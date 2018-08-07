
import UIKit

class ProductViewController: UIViewController {
    
    let requestFactory = RequestFactory()
    var productId = 0
    
    @IBOutlet weak var prodName: UILabel!
    @IBOutlet weak var prodPrice: UILabel!
    @IBOutlet weak var prodDescription: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getProudctInfo()
        self.reloadInputViews()
    }
    
    func getProudctInfo() {
        let product: ShoppingRequestFactory = requestFactory.makeShoppingRequestFatory()
        product.getProduct(idProduct: productId) { response in
            switch response.result {
            case .success(let product):
                print(product)
                DispatchQueue.main.async {
                    self.prodName.text = product.product_name
                    self.prodPrice.text = String(product.product_price)
                    self.prodDescription.text = product.product_description
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    @IBAction func addToBasket(_ sender: Any) {
        let basket: ShoppingRequestFactory = requestFactory.makeShoppingRequestFatory()
        basket.addToCart(idProduct: productId, quantity: 1) { response in
            switch response.result {
            case .success(let addItemResult):
                print(addItemResult)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
