$version: "2"

namespace shopping.inandout.catalog.stand

use shopping.inandout#InputPagination
use shopping.inandout#OutputPagination
use shopping.inandout#UUID

structure CreateStandInput {
    @required
    @httpLabel
    storeId: UUID

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
    storeId: UUID

    @required
    @httpLabel
    standId: UUID
}

structure GetStandOutput {
    @required
    standSummary: StandSummary
}

structure ListStandsInput with [InputPagination] {
    @required
    @httpLabel
    storeId: UUID

    @httpQuery("edgeId")
    edgeId: UUID

    @httpQuery("articleId")
    articleId: UUID
}

structure ListStandsOutput with [OutputPagination] {
    @required
    tokens: StandSummaryList
}

structure UpdateStandInput {
    @required
    @httpLabel
    storeId: UUID

    @required
    @httpLabel
    standId: UUID

    sourceNodeDistance: Integer
}

structure UpdateStandOutput {
    @required
    standSummary: StandSummary
}

structure DeleteStandInput {
    @required
    @httpLabel
    storeId: UUID

    @required
    @httpLabel
    standId: UUID
}

structure DeleteStandOutput {}
