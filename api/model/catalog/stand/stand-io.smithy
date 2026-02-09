$version: "2"

namespace shopping.inandout.catalog.stand

use shopping.inandout#Pagination
use shopping.inandout#UUID

structure CreateStandInput {
    @required
    edgeId: UUID

    @required
    articleId: UUID

    @required
    sourceNodeDistance: Integer
}

structure CreateStandOutput {
    @required
    standId: UUID
}

structure GetStandInput {
    @required
    @httpLabel
    standId: UUID
}

structure GetStandOutput {
    @required
    standSummary: StandSummary
}

structure ListStandsInput with [Pagination] {
    @httpQuery("edgeId")
    edgeId: UUID

    @httpQuery("articleId")
    articleId: UUID
}

structure ListStandsOutput with [Pagination] {
    @required
    tokens: StandSummaryList
}

structure UpdateStandInput {
    @required
    @httpLabel
    standId: UUID

    sourceNodeDistance: Integer
}

structure UpdateStandOutput {}

structure DeleteStandInput {
    @required
    @httpLabel
    standId: UUID
}

structure DeleteStandOutput {}
