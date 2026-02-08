$version: "2"

namespace shopping.inandout.outlet.brand

use shopping.inandout#InvalidInputError
use shopping.inandout#UUID

resource Brand {
    identifiers: {
        brandId: UUID
    }
    properties: {
        name: String
        logoUrl: String
    }
    create: CreateBrand
    read: GetBrand
    update: UpdateBrand
    delete: DeleteBrand
}

@http(method: "POST", uri: "/v0/brands")
operation CreateBrand {
    input: CreateBrandInput
    output: CreateBrandOutput
    errors: [
        InvalidInputError
    ]
}

@readonly
@http(method: "GET", uri: "/v0/brands/{brandId}")
operation GetBrand {
    input: GetBrandInput
    output: GetBrandOutput
    errors: [
        ResourceNotFound
    ]
}

@idempotent
@http(method: "PATCH", uri: "/v0/brands/{brandId}")
operation UpdateBrand {
    input: UpdateBrandInput
    output: UpdateBrandOutput
    errors: [
        ResourceNotFound
        InvalidInputError
    ]
}

@idempotent
@http(method: "DELETE", uri: "/v0/brands/{brandId}")
operation DeleteBrand {
    input: DeleteBrandInput
    output: DeleteBrandOutput
    errors: [
        ResourceNotFound
    ]
}
