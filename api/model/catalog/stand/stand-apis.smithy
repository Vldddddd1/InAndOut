$version: "2"

namespace shopping.inandout.catalog.stand

use shopping.inandout#DeleteRestrictedError
use shopping.inandout#InternalServerError
use shopping.inandout#InvalidInputError
use shopping.inandout#ResourceAlreadyExistsError
use shopping.inandout#ResourceNotFoundError
use shopping.inandout#UUID

resource Stand {
    identifiers: {
        standId: UUID
    }
    properties: {
        edgeId: UUID
        articleId: UUID
        sourceNodeDistance: Integer
        createdAt: Timestamp
        updatedAt: Timestamp
    }
    create: CreateStand
    read: GetStand
    list: ListStands
    update: UpdateStand
    delete: DeleteStand
}

@http(method: "POST", uri: "/v0/stands")
operation CreateStand {
    input: CreateStandInput
    output: CreateStandOutput
    errors: [
        InvalidInputError
        ResourceAlreadyExistsError
        InternalServerError
    ]
}

@readonly
@http(method: "GET", uri: "/v0/stands/{standId}")
operation GetStand {
    input: GetStandInput
    output: GetStandOutput
    errors: [
        InvalidInputError
        ResourceNotFoundError
        InternalServerError
    ]
}

@readonly
@paginated
@http(method: "GET", uri: "/v0/stands")
operation ListStands {
    input: ListStandsInput
    output: ListStandsOutput
    errors: [
        InvalidInputError
        InternalServerError
    ]
}

@http(method: "PUT", uri: "/v0/stands/{standId}")
operation UpdateStand {
    input: UpdateStandInput
    output: UpdateStandOutput
    errors: [
        InvalidInputError
        ResourceNotFoundError
        InternalServerError
    ]
}

@idempotent
@http(method: "DELETE", uri: "/v0/stands/{standId}")
operation DeleteStand {
    input: DeleteStandInput
    output: DeleteStandOutput
    errors: [
        InvalidInputError
        ResourceNotFoundError
        DeleteRestrictedError
        InternalServerError
    ]
}
