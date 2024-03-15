import SwiftUI
import MapKit

enum AboutModels {
    struct Place: Identifiable {
        let id = UUID()
        let latitude: Double
        let longitude: Double
        var coordinate: CLLocationCoordinate2D {
            CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        }
    }
    
    struct Links: Identifiable {
        let id = UUID()
        let url: String
        let image: String
    }
}
