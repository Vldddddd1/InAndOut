$version: "2"

namespace shopping.inandout.catalog.article

use shopping.inandout#AuditMetadata
use shopping.inandout#PositiveDouble
use shopping.inandout#UUID
use shopping.inandout.catalog.product#ProductInput
use shopping.inandout.catalog.product#ProductSummary

structure ArticleInput {
    @required
    @httpLabel
    brandId: UUID

    @required
    price: Double

    currency: String

    @documentation("Existing product referenced in a new article")
    productId: UUID

    @documentation("Create a new product as well")
    productInput: ProductInput
}

structure ArticleSummary with [AuditMetadata] {
    @required
    brandId: UUID

    @required
    articleId: UUID

    @required
    productSummary: ProductSummary

    @required
    price: PositiveDouble

    currency: String
}
