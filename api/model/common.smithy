$version: "2"

namespace com.inandout.common

@regex("^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$")
@length(min: 32, max: 32)
string UUID

list UUIDList {
    member: UUID
}

// Pagination
trait pagination {
    pageSize: Integer
    pageToken: String
}

structure PageInfo {
    nextPageToken: String
}

// Errors

@error("client")
structure ResourceNotFound {
    @required
    message: String
    
    resourceId: String
}

@error("client")
structure ValidationException {
    @required
    message: String
    
    fieldList: ValidationExceptionFieldList
}

list ValidationExceptionFieldList {
    member: ValidationExceptionField
}

structure ValidationExceptionField {
    @required
    path: String

    @required
    message: String
}
