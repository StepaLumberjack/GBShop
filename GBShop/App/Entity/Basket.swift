
import Foundation

struct BasketResult: Codable {
    let amount: Int
    let countGoods: Int
    let contents: [BasketGoods]
}

struct BasketGoods: Codable {
    let id: Int
    let title: String
    let price: Int
    let quantity: Int
    
    enum CodingKeys: String, CodingKey {
        case id = "id_product"
        case title = "product_name"
        case price = "price"
        case quantity = "quantity"
    }
}
