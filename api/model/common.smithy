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
string ResourceName

string ImageUrl

@length(min: 8, max: 64)
@pattern("^[a-zA-Z0-9\\-, ]+$")
string Description

// All UTC offsets fall between this interval: [-12, 14].
// See: https://en.wikipedia.org/wiki/List_of_UTC_offsets.
@range(min: -12, max: 14)
integer UTCTimezone

enum DayType {
    MON = "MON"
    TUE = "TUE"
    WED = "WED"
    THU = "THU"
    FRI = "FRI"
    SAT = "SAT"
    SUN = "SUN"
}

structure TimeRange {
    begin: Timestamp
    end: Timestamp
}

@range(min: 0)
integer MappingVersion

@range(min: -180, max: 180)
double Longitude

@range(min: -90, max: 90)
double Latitude

@mixin
structure Pagination {
    nextToken: String
    tokenCount: Integer
}
