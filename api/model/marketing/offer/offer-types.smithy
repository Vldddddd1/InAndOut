$version: "2"

namespace shopping.inandout.marketing.offer

use shopping.inandout#NaturalNumber
use shopping.inandout#UUID

list DependencyList {
    member: Dependency
}

structure Dependency {
    articleId: UUID
    quantity: NaturalNumber
}
