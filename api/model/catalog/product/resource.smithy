$version: "2"

namespace shopping.inandout.catalog.product

use shopping.inandout#InvalidInputError
use shopping.inandout#ResourceNotFoundError
use shopping.inandout#UUID

resource Product {
    identifiers: {
        productId: UUID
    }
    properties: {
        name: String
        vendor: String
        category: String
    }
    create: CreateProduct
    read: GetProduct
}

@http(method: "POST", uri: "/v0/catalog/products")
operation CreateProduct {
    input: CreateProductInput
    output: CreateProductOutput
    errors: [
        InvalidInputError
    ]
}

@readonly
@http(method: "GET", uri: "/v0/catalog/products/{productId}")
operation GetProduct {
    input: GetProductInput
    output: GetProductOutput
    errors: [
        ResourceNotFoundError
    ]
}
