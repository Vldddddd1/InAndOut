$version: "2"

namespace shopping.inandout.catalog.article

use shopping.inandout#AuditMetadata
use shopping.inandout#UUID

structure ArticleSummary with [AuditMetadata] {
    @required
    articleId: UUID

    @required
    productId: UUID

    @required
    brandId: UUID

    @required
    price: Double

    @required
    currency: String
}

list ArticleSummaryList {
    member: ArticleSummary
}
