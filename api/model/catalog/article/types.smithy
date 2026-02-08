$version: "2"

namespace shopping.inandout.catalog.article

use shopping.inandout#UUID
use shopping.inandout#pagination

structure CreateArticleInput {
    @required
    @httpLabel
    brandId: UUID

    @required
    productId: UUID

    @required
    price: String

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
    brandId: UUID

    @required
    @httpLabel
    articleId: UUID
}

structure GetArticleOutput {
    @required
    articleId: UUID

    @required
    productId: UUID

    @required
    price: String

    @required
    currency: String
}

structure UpdateArticleInput {
    @required
    @httpLabel
    brandId: UUID

    @required
    @httpLabel
    articleId: UUID

    price: String

    currency: String
}

structure UpdateArticleOutput {}

structure DeleteArticleInput {
    @required
    @httpLabel
    brandId: UUID

    @required
    @httpLabel
    articleId: UUID
}

structure DeleteArticleOutput {}

structure ListArticlesInput with [pagination] {
    @required
    @httpLabel
    brandId: UUID
}

structure ListArticlesOutput {
    @required
    items: ArticleList

    nextToken: String

    total: Integer
}

list ArticleList {
    member: ArticleSummary
}

structure ArticleSummary {
    @required
    articleId: UUID

    @required
    productId: UUID

    @required
    price: String

    @required
    currency: String
}
