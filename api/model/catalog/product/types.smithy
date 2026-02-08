$version: "2"

namespace shopping.inandout.catalog.product

use shopping.inandout#UUID

structure CreateProductInput {
    @required
    name: String

    @required
    vendor: String

    category: String
}

structure CreateProductOutput {
    @required
    productId: UUID
}

structure GetProductInput {
    @required
    @httpLabel
    productId: UUID
}

structure GetProductOutput {
    @required
    productId: UUID

    @required
    name: String

    @required
    vendor: String

    category: String
}
