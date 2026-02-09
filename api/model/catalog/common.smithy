$version: "2"

namespace shopping.inandout.catalog

use shopping.inandout#Description
use shopping.inandout#ImageUrl
use shopping.inandout#ResourceName
use shopping.inandout#UUID

@mixin
structure ProductMixin {
    @required
    name: ResourceName

    @required
    subcategory: ResourceName

    @required
    category: ResourceName

    vendor: ResourceName

    imageUrl: ImageUrl

    description: Description
}

structure ProductInput with [ProductMixin] {}

structure ProductSummary with [ProductMixin] {
    @required
    productId: UUID
}
