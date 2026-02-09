$version: "2"

namespace shopping.inandout.marketing.offer

use shopping.inandout#InputPagination
use shopping.inandout#OutputPagination
use shopping.inandout#UUID

structure CreateOfferInput {
    @required
    @httpLabel
    storeId: UUID

    @required
    articleId: UUID

    @required
    discount: Integer

    lifetime: String
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
    offerId: UUID

    @required
    storeId: UUID

    @required
    articleId: UUID

    @required
    discount: Integer

    lifetime: String
}

structure UpdateOfferInput {
    @required
    @httpLabel
    storeId: UUID

    @required
    @httpLabel
    offerId: UUID

    articleId: UUID

    discount: Integer

    lifetime: String
}

structure UpdateOfferOutput {}

structure DeleteOfferInput {
    @required
    @httpLabel
    storeId: UUID

    @required
    @httpLabel
    offerId: UUID
}

structure DeleteOfferOutput {}

structure ListOffersInput with [InputPagination] {
    @required
    @httpLabel
    storeId: UUID
}

structure ListOffersOutput with [OutputPagination] {
    @required
    tokens: OfferList
}

list OfferList {
    member: OfferSummary
}

structure OfferSummary {
    @required
    offerId: UUID

    @required
    articleId: UUID

    @required
    discount: Integer

    lifetime: String
}
