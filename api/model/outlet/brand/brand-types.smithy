$version: "2"

namespace shopping.inandout.outlet.brand

use shopping.inandout#AuditMetadata
use shopping.inandout#ImageUrl
use shopping.inandout#ResourceName
use shopping.inandout#UUID

structure BrandSummary with [AuditMetadata] {
    @required
    brandId: UUID

    @required
    name: ResourceName

    logoUrl: ImageUrl
}
