$version: "2"

namespace shopping.inandout.outlet.store

use shopping.inandout#UUID
use shopping.inandout#pagination

structure CreateStoreInput {
    @required
    brandId: UUID

    @required
    name: String

    @required
    address: String
}

structure CreateStoreOutput {
    @required
    storeId: UUID
}

structure GetStoreInput {
    @required
    @httpLabel
    storeId: UUID
}

structure GetStoreOutput {
    @required
    store: StoreSummary
}

structure StoreSummary {
    @required
    storeId: UUID

    @required
    name: String

    @required
    brandId: UUID

    @required
    address: String

    operatingHours: OperatingHoursMap

    floorCount: Integer
}

map OperatingHoursMap {
    key: String
    value: String
}

structure UpdateStoreInput {
    @required
    @httpLabel
    storeId: UUID

    // Contains mapping updates
    mapping: MappingUpdate
}

structure MappingUpdate {
    nodes: NodeList
    edges: EdgeList
}

list NodeList {
    member: Node
}

structure Node {
    @required
    id: UUID

    @required
    x: Integer

    @required
    y: Integer

    label: String
}

list EdgeList {
    member: Edge
}

structure Edge {
    @required
    startNodeId: UUID

    @required
    endNodeId: UUID

    distance: Integer
}

structure UpdateStoreOutput {}

structure DeleteStoreInput {
    @required
    @httpLabel
    storeId: UUID
}

structure DeleteStoreOutput {}

structure ListStoresInput with [pagination] {}

structure ListStoresOutput {
    @required
    items: StoreList

    nextToken: String

    total: Integer
}

list StoreList {
    member: StoreSummary
}
