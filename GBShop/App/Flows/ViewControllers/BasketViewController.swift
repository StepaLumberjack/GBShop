
import UIKit

class BasketViewController: UITableViewController {
    
    let requestFactory = RequestFactory()
    var products: [BasketGoods] = []
    
    @IBOutlet weak var totalPrice: UILabel!
    @IBOutlet weak var totalCount: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getBasket()
    }
    
    func getBasket() {
        let basket: ShoppingRequestFactory = requestFactory.makeShoppingRequestFatory()
        basket.getBasket(idUser: 123) { response in
            switch response.result {
            case .success(let basketData):
                DispatchQueue.main.async {
                    print(basketData)
                    self.totalPrice.text = String(basketData.amount)
                    self.totalCount.text = String(basketData.countGoods)
                    self.products = basketData.contents
                    self.tableView.reloadData()
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }

    override func numberOfSections(in tableView: UITableView) -> Int {

        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return products.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "basketCell", for: indexPath) as! BasketViewCell
        cell.idProd.text = String(products[indexPath.row].id)
        cell.nameProd.text = products[indexPath.row].title
        cell.priceProd.text = String(products[indexPath.row].price)
        cell.quantityProd.text = String(products[indexPath.row].quantity)
        return cell
    }
}
