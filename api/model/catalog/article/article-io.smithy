$version: "2"

namespace shopping.inandout.catalog.article

use shopping.inandout#Pagination
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

structure ListArticlesInput with [Pagination] {
    @httpQuery("productId")
    productId: UUID

    @httpQuery("brandId")
    brandId: UUID
}

structure ListArticlesOutput with [Pagination] {
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
