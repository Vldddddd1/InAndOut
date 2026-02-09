$version: "2"

namespace shopping.inandout.catalog.article

use shopping.inandout#UUID
use shopping.inandout.catalog#ProductInput

structure CreateArticleInput {
    @required
    @httpLabel
    brandId: UUID

    @required
    price: Double

    currency: String

    @documentation("Existing product referenced in a new article")
    productId: UUID

    @documentation("Create a new product as well")
    productInput: ProductInput
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
    articleSummary: ArticleSummary
}

structure UpdateArticleInput {
    @required
    @httpLabel
    brandId: UUID

    @required
    @httpLabel
    articleId: UUID

    @documentation("Create a new product")
    productInput: ProductInput

    price: Double

    currency: String
}

structure UpdateArticleOutput {
    @required
    articleSummary: ArticleSummary
}

structure DeleteArticleInput {
    @required
    @httpLabel
    brandId: UUID

    @required
    @httpLabel
    articleId: UUID
}

structure DeleteArticleOutput {}
