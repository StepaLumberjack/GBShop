
import Foundation

struct SuccessResult: Codable {
    let result: Int
}

struct ProductResult: Codable {
    let result: Int
    let product_name: String
    let product_price: Int
    let product_description: String
}

struct CatalogResult: Codable {
    let id: Int
    let name: String
    let price: Int

    enum CodingKeys: String, CodingKey {
        case id = "id_product"
        case name = "product_name"
        case price = "price"
    }
}
