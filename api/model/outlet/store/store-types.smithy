$version: "2"

namespace shopping.inandout.outlet.store

use shopping.inandout#AuditMetadata
use shopping.inandout#DayType
use shopping.inandout#Description
use shopping.inandout#ImageUrl
use shopping.inandout#Latitude
use shopping.inandout#Longitude
use shopping.inandout#ResourceName
use shopping.inandout#TimeRange
use shopping.inandout#UTCTimezone
use shopping.inandout#UUID

map OperatingHoursMap {
    key: DayType
    value: TimeRange
}

structure LocationMapping {
    floorList: FloorList
}

list FloorList {
    member: Floor
}

structure Floor {
    @required
    floorId: UUID

    edgeList: EdgeList
}

list EdgeList {
    member: Edge
}

structure Edge {
    @required
    sourceNodeId: UUID

    @required
    targetNodeId: UUID

    name: Integer

    weight: Double
}

@documentation("Also retrieves data of the associated brand")
structure StoreSummary with [AuditMetadata] {
    @required
    name: ResourceName

    @required
    timezone: UTCTimezone

    @required
    brandName: UUID

    @required
    brandLogoUrl: ImageUrl

    description: Description

    imageUrl: ImageUrl

    operatingHoursMap: OperatingHoursMap

    longitude: Longitude

    latitude: Latitude
}

list StoreSummaryList {
    member: StoreSummary
}
