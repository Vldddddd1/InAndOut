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
use shopping.inandout.outlet.brand#BrandSummary

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

    @required
    level: Byte

    edgeList: EdgeList
}

list EdgeList {
    member: Edge
}

structure Edge {
    @required
    sourceNode: Node

    @required
    targetNode: Node

    name: ResourceName

    weight: Double
}

structure Node {
    @required
    number: Integer

    type: NodeType

    name: ResourceName
}

enum NodeType {
    NAVIGATION = "NAVIGATION"
    ELEVATION = "ELEVATION"
    DESCENT = "DESCENT"
}

@documentation("Also retrieves data of the associated brand")
structure StoreSummary with [AuditMetadata] {
    @required
    storeId: UUID

    @required
    name: ResourceName

    @required
    brandSummary: BrandSummary

    description: Description

    imageUrl: ImageUrl

    timezone: UTCTimezone

    operatingHoursMap: OperatingHoursMap

    longitude: Longitude

    latitude: Latitude
}

list StoreSummaryList {
    member: StoreSummary
}
