
import UIKit

class CatalogViewController: UITableViewController {

    let requestFactory = RequestFactory()
    var catalog: [CatalogResult] = [CatalogResult]()
    let identifier = "productCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let catalogFactory: ShoppingRequestFactory = requestFactory.makeShoppingRequestFatory()
        
        catalogFactory.getCatalog(pageNumber: 1, idCategory: 1) {
            [unowned self]
            response in
            switch response.result {
                
            case .success(let products):
                
                for product in products {
                    self.catalog.append(
                        CatalogResult(id: product.id,
                                    name: product.name,
                                    price: product.price)
                    )
                }
                
                DispatchQueue.main.async {
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
        return catalog.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as? CatalogViewCell
        let item = self.catalog[indexPath.row]
        
        cell?.id.text = String(item.id)
        cell?.name.text = item.name
        cell?.price.text = String(item.price)
        
        guard let newCell = cell else {
            print("Something went wrong with productTableViewCell return")
            return UITableViewCell()
        }
        
        return newCell
    }
}
