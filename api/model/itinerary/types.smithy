$version: "2"

namespace shopping.inandout.itinerary

use shopping.inandout#InternalServerError
use shopping.inandout#InvalidInputError
use shopping.inandout#UUID
use shopping.inandout#UUIDList
use shopping.inandout.errors#ResourceNotFoundError

@http(method: "POST", uri: "/v0/itinerary")
operation CreateItinerary {
    input: CreateItineraryInput
    output: CreateItineraryOutput
    errors: [
        InvalidInputError
        ResourceNotFoundError
        InternalServerError
    ]
}

structure CreateItineraryInput {
    @required
    @httpLabel
    storeId: UUID

    @required
    standIds: UUIDList
}

structure CreateItineraryOutput {
    @required
    jobId: UUID

    @required
    status: JobStatus
}

enum JobStatus {
    QUEUED = "queued"
    PROCESSING = "processing"
    COMPLETED = "completed"
    FAILED = "failed"
}
