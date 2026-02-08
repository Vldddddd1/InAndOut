$version: "2"

namespace shopping.inandout.outlet.store

use shopping.inandout#Description
use shopping.inandout#InvalidInputError
use shopping.inandout#Name
use shopping.inandout#UTCTimezone
use shopping.inandout#UUID

resource Store {
    identifiers: {
        storeId: UUID
    }
    properties: {
        name: Name
        description: Description
        brandId: UUID
        imageUrl: String
        timezone: UTCTimezone
        operatingHours: OperatingHoursMap
        longitude: Float
        latitude: Float
        navigationMap: Integer
    }
    create: CreateStore
    read: GetStore
    list: ListStores
    update: UpdateStore
    delete: DeleteStore
}

@http(method: "POST", uri: "/v0/stores")
operation CreateStore {
    input: CreateStoreInput
    output: CreateStoreOutput
    errors: [
        InvalidInputError
    ]
}

@readonly
@http(method: "GET", uri: "/v0/stores?storeId")
operation GetStore {
    input: GetStoreInput
    output: GetStoreOutput
    errors: [
        ResourceNotFound
    ]
}

@idempotent
@http(method: "PUT", uri: "/v0/stores/{storeId}")
operation UpdateStore {
    input: UpdateStoreInput
    output: UpdateStoreOutput
    errors: [
        ResourceNotFound
        InvalidInputError
    ]
}

@idempotent
@http(method: "DELETE", uri: "/v0/stores/{storeId}")
operation DeleteStore {
    input: DeleteStoreInput
    output: DeleteStoreOutput
    errors: [
        ResourceNotFound
    ]
}

@readonly
@http(method: "GET", uri: "/v0/stores")
@paginated(inputToken: "nextToken", outputToken: "nextToken", pageSize: "pageSize")
operation ListStores {
    input: ListStoresInput
    output: ListStoresOutput
}
