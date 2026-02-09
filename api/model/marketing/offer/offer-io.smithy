$version: "2"

namespace shopping.inandout.marketing.offer

use shopping.inandout#InputPagination
use shopping.inandout#NaturalNumber
use shopping.inandout#OutputPagination
use shopping.inandout#Percentage
use shopping.inandout#TimeRange
use shopping.inandout#UUID
use shopping.inandout#UUIDList

structure CreateOfferInput {
    @required
    @httpLabel
    storeId: UUID

    @required
    percentage: Percentage

    articleIdList: UUIDList

    dependencyList: DependencyList

    timeRange: TimeRange

    lifetime: NaturalNumber
}

structure CreateOfferOutput {
    @required
    offerId: UUID
}

structure GetOfferInput {
    @required
    @httpLabel
    storeId: UUID

    @required
    @httpLabel
    offerId: UUID
}

structure GetOfferOutput {
    @required
    offerSummary: OfferSummary
}

structure ListOffersInput with [InputPagination] {
    @required
    @httpLabel
    storeId: UUID
}

structure ListOffersOutput with [OutputPagination] {
    @required
    tokens: OfferSummaryList
}

structure UpdateOfferInput {
    @required
    @httpLabel
    storeId: UUID

    @required
    @httpLabel
    offerId: UUID

    percentage: Percentage

    articleIdList: UUIDList

    dependencyList: DependencyList

    timeRange: TimeRange

    lifetime: NaturalNumber
}

structure UpdateOfferOutput {
    @required
    offerSummary: OfferSummary
}

structure DeleteOfferInput {
    @required
    @httpLabel
    storeId: UUID

    @required
    @httpLabel
    offerId: UUID
}

structure DeleteOfferOutput {}
