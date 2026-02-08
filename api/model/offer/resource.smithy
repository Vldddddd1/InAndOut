$version: "2"

namespace shopping.inandout.marketing.offer

use shopping.inandout#InvalidInputError
use shopping.inandout#ResourceNotFound
use shopping.inandout#UUID

resource Offer {
    identifiers: {
        offerId: UUID
    }
    properties: {
        storeId: UUID
        articleId: UUID
        discount: Integer
        lifetime: String
    }
    create: CreateOffer
    read: GetOffer
    update: UpdateOffer
    delete: DeleteOffer
    list: ListOffers
}

@http(method: "POST", uri: "/v0/stores/{storeId}/offers")
operation CreateOffer {
    input: CreateOfferInput
    output: CreateOfferOutput
    errors: [
        InvalidInputError
    ]
}

@readonly
@http(method: "GET", uri: "/v0/stores/{storeId}/offers/{offerId}")
operation GetOffer {
    input: GetOfferInput
    output: GetOfferOutput
    errors: [
        ResourceNotFound
    ]
}

@idempotent
@http(method: "PUT", uri: "/v0/stores/{storeId}/offers/{offerId}")
operation UpdateOffer {
    input: UpdateOfferInput
    output: UpdateOfferOutput
    errors: [
        ResourceNotFound
        InvalidInputError
    ]
}

@idempotent
@http(method: "DELETE", uri: "/v0/stores/{storeId}/offers/{offerId}")
operation DeleteOffer {
    input: DeleteOfferInput
    output: DeleteOfferOutput
    errors: [
        ResourceNotFound
    ]
}

@readonly
@http(method: "GET", uri: "/v0/stores/{storeId}/offers")
@paginated(inputToken: "nextToken", outputToken: "nextToken", pageSize: "pageSize")
operation ListOffers {
    input: ListOffersInput
    output: ListOffersOutput
}
