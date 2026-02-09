$version: "2"

namespace shopping.inandout.catalog.article

use shopping.inandout#InputPagination
use shopping.inandout#OutputPagination
use shopping.inandout#UUID

structure CreateArticleInput {
    @required
    productId: UUID

    @required
    brandId: UUID

    @required
    price: Double

    @required
    currency: String
}

structure CreateArticleOutput {
    @required
    articleId: UUID
}

structure GetArticleInput {
    @required
    @httpLabel
    articleId: UUID
}

structure GetArticleOutput {
    @required
    articleSummary: ArticleSummary
}

structure ListArticlesInput with [InputPagination] {
    @httpQuery("productId")
    productId: UUID

    @httpQuery("brandId")
    brandId: UUID
}

structure ListArticlesOutput with [OutputPagination] {
    @required
    tokens: ArticleSummaryList
}

structure UpdateArticleInput {
    @required
    @httpLabel
    articleId: UUID

    price: Double

    currency: String
}

structure UpdateArticleOutput {}

structure DeleteArticleInput {
    @required
    @httpLabel
    articleId: UUID
}

structure DeleteArticleOutput {}
