$version: "2"

namespace shopping.inandout.catalog.stand

use shopping.inandout#InvalidInputError
use shopping.inandout#ResourceNotFound
use shopping.inandout#UUID
use shopping.inandout#pagination

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

structure CreateStandInput {
    @required
    @httpLabel
    storeId: UUID

    @required
    edgeId: UUID

    @required
    sourceNodeDistance: Integer

    // One of articleId or product+price
    articleId: UUID

    // For composite creation
    product: ProductInput

    price: String
}

structure ProductInput {
    name: String
    vendor: String
    category: String
}

structure CreateStandOutput {
    @required
    standId: UUID

    articleId: UUID

    productId: UUID
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

structure GetStandInput {
    @required
    @httpLabel
    storeId: UUID

    @required
    @httpLabel
    standId: UUID
}

structure GetStandOutput {
    @required
    stand: StandSummary
}

structure StandSummary {
    @required
    standId: UUID

    @required
    storeId: UUID

    @required
    articleId: UUID

    @required
    edgeId: UUID

    @required
    sourceNodeDistance: Integer
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

structure UpdateStandInput {
    @required
    @httpLabel
    storeId: UUID

    @required
    @httpLabel
    standId: UUID

    edgeId: UUID

    sourceNodeDistance: Integer

    articleId: UUID
}

structure UpdateStandOutput {}

@idempotent
@http(method: "DELETE", uri: "/v0/stores/{storeId}/stands/{standId}")
operation DeleteStand {
    input: DeleteStandInput
    output: DeleteStandOutput
    errors: [
        ResourceNotFound
    ]
}

structure DeleteStandInput {
    @required
    @httpLabel
    storeId: UUID

    @required
    @httpLabel
    standId: UUID
}

structure DeleteStandOutput {}

@readonly
@http(method: "GET", uri: "/v0/stores/{storeId}/stands")
@paginated(inputToken: "nextToken", outputToken: "nextToken", pageSize: "pageSize")
operation ListStands {
    input: ListStandsInput
    output: ListStandsOutput
}

structure ListStandsInput with [pagination] {
    @required
    @httpLabel
    storeId: UUID
}

structure ListStandsOutput {
    @required
    items: StandList

    nextToken: String

    total: Integer
}

list StandList {
    member: StandSummary
}
