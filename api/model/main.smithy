$version: "2"

namespace shopping.inandout

use shopping.inandout.catalog.article#Article
use shopping.inandout.catalog.product#Product
use shopping.inandout.catalog.stand#Stand
use shopping.inandout.itinerary#CreateItinerary
use shopping.inandout.marketing.offer#Offer
use shopping.inandout.outlet.brand#Brand
use shopping.inandout.outlet.store#Store

@paginated(inputToken: "nextToken", outputToken: "nextToken", pageSize: "pageSize")
service InAndOut {
    version: "2026-04-01"
    resources: [
        Store
        Brand
        Stand
        Article
        Product
        Offer
    ]
    operations: [
        CreateItinerary
    ]
}
