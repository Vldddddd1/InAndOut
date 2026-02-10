$version: "2"

namespace shopping.inandout.marketing.offer

use shopping.inandout#AuditMetadata
use shopping.inandout#NaturalNumber
use shopping.inandout#Percentage
use shopping.inandout#TimeRange
use shopping.inandout#UUID
use shopping.inandout#UUIDList
use shopping.inandout.catalog.article#Article
use shopping.inandout.outlet.store#Store

list DependencyList {
    member: Dependency
}

@references([
    {
        resource: Article
    }
])
@documentation("Product dependency; it must be bought in order for the offer to activate")
structure Dependency {
    articleId: UUID
    quantity: NaturalNumber
}

// This is used for in all input structures of the offer operations.
// Imagine having to write this for all of them repeatedly.
@mixin
@references([
    {
        resource: Store
    }
])
@documentation("Internal helper structure used to diminish the verbosity of the storeId field")
structure StoreIdMixin {
    @required
    @httpLabel
    storeId: UUID
}

@mixin
structure OfferMixin {
    articleIdList: UUIDList
    dependencyList: DependencyList
    timeRange: TimeRange
    lifetime: NaturalNumber
}

@mixin
structure OfferInputMixin with [OfferMixin] {}

@mixin
@references([
    {
        resource: Store
    }
])
structure OfferOutputMixin with [AuditMetadata, OfferMixin] {
    @required
    storeId: UUID

    @required
    offerId: UUID

    @required
    percentage: Percentage
}

structure OfferSummary with [OfferOutputMixin] {}

list OfferSummaryList {
    member: OfferSummary
}
