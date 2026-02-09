$version: "2"

namespace shopping.inandout.marketing.offer

use shopping.inandout#DeleteRestrictedError
use shopping.inandout#InternalServerError
use shopping.inandout#InvalidInputError
use shopping.inandout#Percentage
use shopping.inandout#ResourceAlreadyExistsError
use shopping.inandout#ResourceNotFoundError
use shopping.inandout#TimeRange
use shopping.inandout#UUID
use shopping.inandout#UUIDList

resource Offer {
    identifiers: {
        offerId: UUID
    }
    properties: {
        storeId: UUID
        articleIdList: UUIDList
        dependencyList: DependencyList
        percentage: Percentage
        createdAt: Integer
        lifetime: String
        timeRange: TimeRange
    }
    create: CreateOffer
    read: GetOffer
    list: ListOffers
    update: UpdateOffer
    delete: DeleteOffer
}

@http(method: "POST", uri: "/v0/stores/{storeId}/offers")
operation CreateOffer {
    input: CreateOfferInput
    output: CreateOfferOutput
    errors: [
        InvalidInputError
        ResourceAlreadyExistsError
        InternalServerError
    ]
}

@readonly
@http(method: "GET", uri: "/v0/stores/{storeId}/offers/{offerId}")
operation GetOffer {
    input: GetOfferInput
    output: GetOfferOutput
    errors: [
        InvalidInputError
        ResourceNotFoundError
        InternalServerError
    ]
}

@readonly
@paginated
@http(method: "GET", uri: "/v0/stores/{storeId}/offers")
operation ListOffers {
    input: ListOffersInput
    output: ListOffersOutput
}

@http(method: "PATCH", uri: "/v0/stores/{storeId}/offers/{offerId}")
operation UpdateOffer {
    input: UpdateOfferInput
    output: UpdateOfferOutput
    errors: [
        InvalidInputError
        ResourceNotFoundError
        InternalServerError
    ]
}

@idempotent
@http(method: "DELETE", uri: "/v0/stores/{storeId}/offers/{offerId}")
operation DeleteOffer {
    input: DeleteOfferInput
    output: DeleteOfferOutput
    errors: [
        InvalidInputError
        ResourceNotFoundError
        DeleteRestrictedError
        InternalServerError
    ]
}
