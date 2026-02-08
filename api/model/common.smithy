$version: "2"

namespace shopping.inandout

@pattern("^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$")
@length(min: 32, max: 32)
string UUID

list UUIDList {
    member: UUID
}

@length(min: 3, max: 32)
@pattern("^[a-zA-Z0-9\\- ]+$")
string Name

@length(min: 8, max: 64)
@pattern("^[a-zA-Z0-9\\-, ]+$")
string Description

// All UTC offsets fall between this interval: [-12, 14].
// See: https://en.wikipedia.org/wiki/List_of_UTC_offsets.
@range(min: -12, max: 14)
integer UTCTimezone

@mixin
structure pagination {
    nextToken: String
    pageSize: Integer
}
