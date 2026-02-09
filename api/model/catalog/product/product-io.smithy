$version: "2"

namespace shopping.inandout.catalog.product

use shopping.inandout#Description
use shopping.inandout#ImageUrl
use shopping.inandout#Pagination
use shopping.inandout#ResourceName
use shopping.inandout#UUID

structure CreateProductInput {
    @required
    variant: ResourceName

    @required
    subcategory: ResourceName

    @required
    category: ResourceName

    @required
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

structure ListProductsInput with [Pagination] {
    @httpQuery("category")
    category: ResourceName

    @httpQuery("subcategory")
    subcategory: ResourceName

    @httpQuery("vendor")
    vendor: ResourceName
}

structure ListProductsOutput with [Pagination] {
    @required
    tokens: ProductSummaryList
}

structure UpdateProductInput {
    @required
    @httpLabel
    productId: UUID

    variant: ResourceName

    subcategory: ResourceName

    category: ResourceName

    vendor: ResourceName

    imageUrl: ImageUrl

    description: Description
}

structure UpdateProductOutput {}

structure DeleteProductInput {
    @required
    @httpLabel
    productId: UUID
}

structure DeleteProductOutput {}
