$version: "2"

namespace shopping.inandout.catalog.stand

use shopping.inandout#InputPagination
use shopping.inandout#OutputPagination
use shopping.inandout#UUID
use shopping.inandout.catalog.article#ArticleInput

structure CreateStandInput {
    @required
    @httpLabel
    storeId: UUID

    @required
    edgeId: UUID

    @required
    sourceNodeDistance: Integer

    @documentation("Existing article referenced in a new stand")
    articleId: UUID

    @documentation("Create a new article as well")
    articleInput: ArticleInput
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

    edgeId: UUID

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
