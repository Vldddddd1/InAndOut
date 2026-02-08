$version: "2"

namespace shopping.inandout.outlet.brand

use shopping.inandout#UUID

structure CreateBrandInput {
    @required
    name: String

    @required
    logoUrl: String
}

structure CreateBrandOutput {}

structure GetBrandInput {
    @required
    @httpLabel
    brandId: UUID
}

structure GetBrandOutput {
    @required
    brandId: UUID

    @required
    name: String

    @required
    logoUrl: String
}

structure UpdateBrandInput {
    @required
    @httpLabel
    brandId: UUID

    name: String

    logoUrl: String
}

structure UpdateBrandOutput {}

structure DeleteBrandInput {
    @required
    @httpLabel
    brandId: UUID
}

structure DeleteBrandOutput {}
