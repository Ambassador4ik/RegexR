import SwiftUI
import MapKit

struct AboutView: View {
    let hsePlace: AboutModels.Place
    let places: [AboutModels.Place]
    @State private var hseRegion: MKCoordinateRegion
    
    init () {
        hsePlace = AboutModels.Place(latitude: 55.754032, longitude: 37.648914)
        places = [hsePlace]
        
        _hseRegion = State<MKCoordinateRegion>.init(initialValue: MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: hsePlace.latitude, longitude: hsePlace.longitude), span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)))
    }
    
    
    let links = [
        AboutModels.Links(url: "mailto:hse@hse.ru", image: "envelope.fill"),
        AboutModels.Links( url: "https://www.hse.ru/", image: "network"),
        AboutModels.Links( url: "tel:+74957713232", image: "phone.fill"),
    ]

    var body: some View {
        VStack {
            Text("RegexR")
                .font(.title)
                .padding()
            HStack {
                ForEach(links) { link in
                    Link(destination: URL(string: link.url)!) {
                        Image(systemName: link.image)
                    }
                    .padding()
                    .font(.system(size: 32))
                }
                    
            }
            Text("We on maps")
                .font(.title2)
                .padding(.top, 20)
            Map(coordinateRegion: $hseRegion, showsUserLocation: true,  annotationItems: places){ place in
                MapMarker(coordinate: place.coordinate, tint: .blue)
            }
            .padding(.horizontal)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
    }
}

struct AboutView_Previews: PreviewProvider {
    static var previews: some View {
        AboutView()
    }
}
