$version: "2"

namespace shopping.inandout.outlet.brand

use shopping.inandout#AuditMetadata
use shopping.inandout#ImageUrl
use shopping.inandout#ResourceName

structure BrandSummary with [AuditMetadata] {
    name: ResourceName
    logoUrl: ImageUrl
}
