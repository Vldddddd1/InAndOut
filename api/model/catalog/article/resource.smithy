$version: "2"

namespace shopping.inandout.catalog.article

use shopping.inandout#InvalidInputError
use shopping.inandout#ResourceNotFoundError
use shopping.inandout#UUID

resource Article {
    identifiers: {
        articleId: UUID
    }
    properties: {
        brandId: UUID
        productId: UUID
        price: String
        currency: String
    }
    create: CreateArticle
    read: GetArticle
    update: UpdateArticle
    delete: DeleteArticle
    list: ListArticles
}

@http(method: "POST", uri: "/v0/brands/{brandId}/articles")
operation CreateArticle {
    input: CreateArticleInput
    output: CreateArticleOutput
    errors: [
        InvalidInputError
    ]
}

@readonly
@http(method: "GET", uri: "/v0/brands/{brandId}/articles/{articleId}")
operation GetArticle {
    input: GetArticleInput
    output: GetArticleOutput
    errors: [
        ResourceNotFoundError
    ]
}

@idempotent
@http(method: "PATCH", uri: "/v0/brands/{brandId}/articles/{articleId}")
operation UpdateArticle {
    input: UpdateArticleInput
    output: UpdateArticleOutput
    errors: [
        InvalidInputError
        ResourceNotFoundError
    ]
}

@idempotent
@http(method: "DELETE", uri: "/v0/brands/{brandId}/articles/{articleId}")
operation DeleteArticle {
    input: DeleteArticleInput
    output: DeleteArticleOutput
    errors: [
        ResourceNotFoundError
    ]
}

@readonly
@http(method: "GET", uri: "/v0/brands/{brandId}/articles")
@paginated(inputToken: "nextToken", outputToken: "nextToken", pageSize: "pageSize")
operation ListArticles {
    input: ListArticlesInput
    output: ListArticlesOutput
}
