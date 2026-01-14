$version: "2"

namespace com.inandout.catalog

use com.inandout.common#UUID
use com.inandout.common#UUIDList
use com.inandout.common#pagination

resource Stand {
    identifiers: { standId: UUID }
    properties: {
        edgeId: UUID
        articleId: UUID
        sourceNodeDistance: Integer
    }
    list: ListStands
}

@readonly
@http(method: "LIST", uri: "/stands")
operation ListStands {
    input: ListStandsInput
    output: ListStandsOutput
    // todo errors: []
}

structure ListStandsInput with [pagination] {
    @required
    @httpLabel
    storeId: UUID
}

structure ListStandsOutput {
    @required
    items: UUIDList

    nextPageToken: String
}
