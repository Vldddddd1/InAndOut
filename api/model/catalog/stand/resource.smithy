$version: "2"

namespace shopping.inandout.catalog.stand

use shopping.inandout#InvalidInputError
use shopping.inandout#ResourceNotFound
use shopping.inandout#UUID

resource Stand {
    identifiers: {
        standId: UUID
    }
    properties: {
        storeId: UUID
        edgeId: UUID
        articleId: UUID
        sourceNodeDistance: Integer
    }
    create: CreateStand
    read: GetStand
    update: UpdateStand
    delete: DeleteStand
    list: ListStands
}

@http(method: "POST", uri: "/v0/stores/{storeId}/stands")
operation CreateStand {
    input: CreateStandInput
    output: CreateStandOutput
    errors: [
        InvalidInputError
    ]
}

@readonly
@http(method: "GET", uri: "/v0/stores/{storeId}/stands/{standId}")
operation GetStand {
    input: GetStandInput
    output: GetStandOutput
    errors: [
        ResourceNotFound
    ]
}

@idempotent
@http(method: "PATCH", uri: "/v0/stores/{storeId}/stands/{standId}")
operation UpdateStand {
    input: UpdateStandInput
    output: UpdateStandOutput
    errors: [
        ResourceNotFound
        InvalidInputError
    ]
}

@idempotent
@http(method: "DELETE", uri: "/v0/stores/{storeId}/stands/{standId}")
operation DeleteStand {
    input: DeleteStandInput
    output: DeleteStandOutput
    errors: [
        ResourceNotFound
    ]
}

@readonly
@http(method: "GET", uri: "/v0/stores/{storeId}/stands")
@paginated(inputToken: "nextToken", outputToken: "nextToken", pageSize: "pageSize")
operation ListStands {
    input: ListStandsInput
    output: ListStandsOutput
}
