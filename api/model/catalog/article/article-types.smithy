$version: "2"

namespace shopping.inandout.catalog.article

use shopping.inandout#AuditMetadata
use shopping.inandout#PositiveDouble
use shopping.inandout#UUID
use shopping.inandout.catalog#ProductSummary

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
