$version: "2"

namespace shopping.inandout.catalog.product

use shopping.inandout#AuditMetadata
use shopping.inandout#Description
use shopping.inandout#ImageUrl
use shopping.inandout#ResourceName
use shopping.inandout#UUID

structure ProductSummary with [AuditMetadata] {
    @required
    productId: UUID

    @required
    variant: ResourceName

    @required
    subcategory: ResourceName

    @required
    category: ResourceName

    @required
    vendor: ResourceName

    imageUrl: ImageUrl

    description: Description
}

list ProductSummaryList {
    member: ProductSummary
}
