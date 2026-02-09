$version: "2"

namespace shopping.inandout.marketing.offer

use shopping.inandout#AuditMetadata
use shopping.inandout#NaturalNumber
use shopping.inandout#UUID

list DependencyList {
    member: Dependency
}

structure Dependency {
    articleId: UUID
    quantity: NaturalNumber
}

structure OfferSummary with [AuditMetadata] {
    @required
    offerId: UUID

    @required
    storeId: UUID

    @required
    articleId: UUID

    @required
    discount: Integer

    lifetime: String
}

list OfferSummaryList {
    member: OfferSummary
}
