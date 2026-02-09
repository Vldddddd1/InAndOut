$version: "2"

namespace shopping.inandout.outlet.store

use shopping.inandout#Description
use shopping.inandout#ImageUrl
use shopping.inandout#InputPagination
use shopping.inandout#Latitude
use shopping.inandout#Longitude
use shopping.inandout#NaturalNumber
use shopping.inandout#OutputPagination
use shopping.inandout#ResourceName
use shopping.inandout#UTCTimezone
use shopping.inandout#UUID

structure CreateStoreInput {
    @required
    brandId: UUID

    @required
    name: ResourceName

    description: Description

    imageUrl: ImageUrl

    timezone: UTCTimezone

    operatingHoursMap: OperatingHoursMap

    locationMapping: LocationMapping

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

    @httpQuery("userLongitude")
    userLongitude: Longitude

    @httpQuery("userLatitude")
    userLatitude: Latitude

    // ! User location must be provided in order for the below queries to work.
    @httpQuery("isOpen")
    isOpen: Boolean

    @httpQuery("maxDistance")
    @documentation("Distance measured in kilometers")
    maxDistance: NaturalNumber
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

    timezone: UTCTimezone

    operatingHoursMap: OperatingHoursMap

    locationMapping: LocationMapping

    longitude: Longitude

    latitude: Latitude
}

structure UpdateStoreOutput {
    @required
    storeSummary: StoreSummary
}

structure DeleteStoreInput {
    @required
    @httpLabel
    storeId: UUID
}

structure DeleteStoreOutput {}
