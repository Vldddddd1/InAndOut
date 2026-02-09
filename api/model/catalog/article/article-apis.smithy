$version: "2"

namespace shopping.inandout.catalog.article

use shopping.inandout#DeleteRestrictedError
use shopping.inandout#InternalServerError
use shopping.inandout#InvalidInputError
use shopping.inandout#ResourceAlreadyExistsError
use shopping.inandout#ResourceNotFoundError
use shopping.inandout#UUID

resource Article {
    identifiers: {
        articleId: UUID
    }
    properties: {
        productId: UUID
        brandId: UUID
        price: Double
        currency: String
        createdAt: Timestamp
        updatedAt: Timestamp
    }
    create: CreateArticle
    read: GetArticle
    list: ListArticles
    update: UpdateArticle
    delete: DeleteArticle
}

@http(method: "POST", uri: "/v0/articles")
operation CreateArticle {
    input: CreateArticleInput
    output: CreateArticleOutput
    errors: [
        InvalidInputError
        ResourceAlreadyExistsError
        InternalServerError
    ]
}

@readonly
@http(method: "GET", uri: "/v0/articles/{articleId}")
operation GetArticle {
    input: GetArticleInput
    output: GetArticleOutput
    errors: [
        InvalidInputError
        ResourceNotFoundError
        InternalServerError
    ]
}

@readonly
@paginated
@http(method: "GET", uri: "/v0/articles")
operation ListArticles {
    input: ListArticlesInput
    output: ListArticlesOutput
    errors: [
        InvalidInputError
        InternalServerError
    ]
}

@http(method: "PUT", uri: "/v0/articles/{articleId}")
operation UpdateArticle {
    input: UpdateArticleInput
    output: UpdateArticleOutput
    errors: [
        InvalidInputError
        ResourceNotFoundError
        InternalServerError
    ]
}

@idempotent
@http(method: "DELETE", uri: "/v0/articles/{articleId}")
operation DeleteArticle {
    input: DeleteArticleInput
    output: DeleteArticleOutput
    errors: [
        InvalidInputError
        ResourceNotFoundError
        DeleteRestrictedError
        InternalServerError
    ]
}
