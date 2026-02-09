$version: "2"

namespace shopping.inandout.catalog.stand

use shopping.inandout#AuditMetadata
use shopping.inandout#PositiveDouble
use shopping.inandout#UUID
use shopping.inandout.catalog.article#ArticleSummary

structure StandSummary with [AuditMetadata] {
    @required
    standId: UUID

    @required
    edgeId: UUID

    @required
    artileSummary: ArticleSummary

    @required
    sourceNodeDistance: PositiveDouble
}

list StandSummaryList {
    member: StandSummary
}
