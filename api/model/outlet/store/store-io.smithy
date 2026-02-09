$version: "2"

namespace shopping.inandout.outlet.store

use shopping.inandout#Description
use shopping.inandout#ImageUrl
use shopping.inandout#InputPagination
use shopping.inandout#Latitude
use shopping.inandout#Longitude
use shopping.inandout#OutputPagination
use shopping.inandout#ResourceName
use shopping.inandout#UTCTimezone
use shopping.inandout#UUID

structure CreateStoreInput {
    @required
    brandId: UUID

    @required
    name: ResourceName

    timezone: UTCTimezone

    description: Description

    imageUrl: ImageUrl

    longitude: Longitude

    latitude: Latitude
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
    storeSummary: StoreSummary
}

@documentation("Retrieve a list of stores based on the provided queries")
structure ListStoresInput with [InputPagination] {
    @httpQuery("name")
    name: ResourceName

    @httpQuery("isOpenNow")
    isOpenNow: Boolean

    @httpQuery("userTimezone")
    userTimezone: UTCTimezone

    @documentation("If provided all the subfields must be fulfilled")
    userDistanceQuery: UserDistanceQuery
}

structure ListStoresOutput with [OutputPagination] {
    @required
    tokens: StoreSummaryList
}

structure UpdateStoreInput {
    @required
    @httpLabel
    storeId: UUID

    name: ResourceName

    description: Description

    imageUrl: ImageUrl

    operatingHoursMap: OperatingHoursMap

    locationMapping: LocationMapping
}

structure UpdateStoreOutput {}

structure DeleteStoreInput {
    @required
    @httpLabel
    storeId: UUID
}

structure DeleteStoreOutput {}
