$version: "2"

namespace shopping.inandout.outlet.brand

use shopping.inandout#UUID

structure CreateBrandInput {
    @required
    name: String

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
    brandSummary: BrandSummary
}

structure UpdateBrandInput {
    @required
    @httpLabel
    brandId: UUID

    name: String

    logoUrl: String
}

structure UpdateBrandOutput {
    @required
    brandSummary: BrandSummary
}

structure DeleteBrandInput {
    @required
    @httpLabel
    brandId: UUID
}

structure DeleteBrandOutput {}
