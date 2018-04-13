import GoogleMaps
import UIKit

class markerMetaData: GMSMarker {
    let marker_coordinates: CLLocationCoordinate2D;
    let markerID = Int
    
    init(marker_coordinates: CLLocationCoordinate2D) {
        self.marker_coordinates = marker_coordinates
        self.markerID = 1
        super.init()
        
        position = marker_coordinates
        appearAnimation = .pop
    }
    (marker_coordinates: CLLocationCoordinate2D, markerID: Int) {
    self.marker_coordinates = marker_coordinates
    self.markerID = markerID
    super.init()
    
    position = marker_coordinates
    appearAnimation = .pop
    }
}
