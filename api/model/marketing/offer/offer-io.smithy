$version: "2"

namespace shopping.inandout.marketing.offer

use shopping.inandout#InputPagination
use shopping.inandout#NaturalNumber
use shopping.inandout#OutputPagination
use shopping.inandout#Percentage
use shopping.inandout#TimeRange
use shopping.inandout#UUID
use shopping.inandout#UUIDList

structure CreateOfferInput with [StoreIdMixin, OfferInputMixin] {
    @required
    percentage: Percentage
}

structure CreateOfferOutput {
    @required
    offerId: UUID
}

structure GetOfferInput with [StoreIdMixin] {
    @required
    @httpLabel
    offerId: UUID
}

structure GetOfferOutput with [OfferOutputMixin] {}

structure ListOffersInput with [StoreIdMixin, InputPagination] {}

structure ListOffersOutput with [OutputPagination] {
    @required
    tokens: OfferSummaryList
}

structure UpdateOfferInput with [StoreIdMixin, OfferInputMixin] {
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

structure UpdateOfferOutput with [OfferOutputMixin] {}

structure DeleteOfferInput with [StoreIdMixin] {
    @required
    @httpLabel
    offerId: UUID
}

structure DeleteOfferOutput {}
