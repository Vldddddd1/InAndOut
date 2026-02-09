$version: "2"

namespace shopping.inandout.catalog.product

use shopping.inandout#Description
use shopping.inandout#ImageUrl
use shopping.inandout#ResourceName
use shopping.inandout#UUID

structure CreateProductInput {
    @required
    name: ResourceName

    @required
    subcategory: ResourceName

    @required
    category: ResourceName

    vendor: ResourceName

    imageUrl: ImageUrl

    description: Description
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
    productSummary: ProductSummary
}

structure UpdateProductInput {
    @required
    @httpLabel
    productId: UUID

    name: ResourceName

    subcategory: ResourceName

    category: ResourceName

    vendor: ResourceName

    imageUrl: ImageUrl

    description: Description
}

structure UpdateProductOutput {
    @required
    productSummary: ProductSummary
}

structure DeleteProductInput {
    @required
    @httpLabel
    productId: UUID
}

structure DeleteProductOutput {}
