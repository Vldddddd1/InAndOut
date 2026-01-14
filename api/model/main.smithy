$version: "2"

namespace com.inandout

use com.inandout.common#UUID
use com.inandout.common#UUIDList
use com.inandout.catalog#Stand

service InAndOut {
    version: "2024-04-01"
    resources: [Stand]
    operations: [
        CreateItinerary
    ]
}

@http(method: "POST", uri: "/itinerary")
operation CreateItinerary {
    input: CreateItineraryInput
    output: CreateItineraryOutput
    // todo errors: []
}

structure CreateItineraryInput {
    @required
    @httpLabel
    storeId: UUID

    @required
    articleIds: UUIDList
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
