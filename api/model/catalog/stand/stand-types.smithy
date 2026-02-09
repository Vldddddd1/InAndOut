$version: "2"

namespace shopping.inandout.catalog.stand

use shopping.inandout#AuditMetadata
use shopping.inandout#UUID

structure StandSummary with [AuditMetadata] {
    @required
    standId: UUID

    @required
    edgeId: UUID

    @required
    articleId: UUID

    @required
    sourceNodeDistance: Integer
}

list StandSummaryList {
    member: StandSummary
}
