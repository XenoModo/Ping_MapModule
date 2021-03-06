import UIKit
import GoogleMaps

class MapViewController: UIViewController {
    
    
    @IBOutlet weak var mapView: GMSMapView!
    @IBOutlet weak var pingButton: UIButton!
    private let locationManager = CLLocationManager()
    var centerMapCoordinate:CLLocationCoordinate2D!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        /*
        let camera = GMSCameraPosition.camera(withLatitude: 37.36, longitude: -122.0, zoom: 6.0)
        mapView.camera = camera
        showMarker(position: camera.target)
        */
        //
        
        //debugCenterMarker.isHidden = true
        
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        
    }
    func showMarker(position: CLLocationCoordinate2D){
        let marker = GMSMarker()
        marker.position = position
        marker.title = "test title"
        marker.snippet = "test snippet"
        marker.map = mapView
    }

    @IBAction func pingAction(_ sender: UIButton) {
        centerMapCoordinate = getCenterCoordinates()
        
        addMarker(centerMapCoordinate: centerMapCoordinate)
        
    }

    
}

//Extensions

extension ViewController: GMSMapViewDelegate {
    
    //Marker Info window Tap
    func mapView(_ mapView: GMSMapView, didTapInfoWindowOf marker: GMSMarker){
        print("didtapinfowindowof")
    }
    
    //Marker Info window Hold
    func mapView(_ mapView: GMSMapView, didLongPressInfoWindowOf marker: GMSMarker){
        print ("didLongPressInfoWindowOf")
    }
    
    func mapView(_ mapView: GMSMapView, markerInfoWindow marker: GMSMarker) -> UIView? {
        let view = UIView(frame: CGRect.init(x: 0, y: 0, width: 200, height: 70))
        view.backgroundColor = UIColor.white
        view.layer.cornerRadius = 6
        
        let lbl1 = UILabel(frame: CGRect.init(x: 8, y: 8, width: view.frame.size.width - 16, height: 15))
        lbl1.text = "Hi there"
        view.addSubview(lbl1)
        
        let lbl2 = UILabel(frame: CGRect.init(x: lbl1.frame.origin.x, y: lbl1.frame.origin.y + lbl1.frame.size.height + 3, width: view.frame.size.width - 16, height: 15))
        lbl2.text = "Im a custom info window"
        lbl2.font = UIFont.systemFont(ofSize: 14, weight: .light)
        view.addSubview(lbl2)
        
        return view
    }
}

extension MapViewController: CLLocationManagerDelegate {
    //This function runs everytime the location services permission changes
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        guard status == .authorizedWhenInUse else {
            return
        }
        
        //Updates the users location
        locationManager.startUpdatingLocation()
        
        //Draws a light blue dot on the users current location and also adds a button to focus onto the users location
        mapView.isMyLocationEnabled = true
        mapView.settings.myLocationButton = true
    }
    
    //This function executes when the location manager is updated
    func locationManager(_ manager: CLLocationManager, didUpdateLocations location: [CLLocation]) {
        guard let location = location.first else {
            return
        }
        
        //Centers onto the users location
        mapView.camera = GMSCameraPosition(target: location.coordinate, zoom: 15, bearing: 0, viewingAngle: 0)
        
        //Stop updating the users location
        locationManager.stopUpdatingLocation()
    }
    
    
    //This function executes when the user moves the map
    func mapView(_ mapView: GMSMapView, didChange position: GMSCameraPosition)  {
        let latitude = mapView.camera.target.latitude
        let longitude = mapView.camera.target.longitude
        centerMapCoordinate = CLLocationCoordinate2D(latitude:latitude, longitude:longitude)
        //let movingmarker = markerMetaData(marker_coordinates: centerMapCoordinate, 2)
    }
    
    //Debug function to get centre map location
    func getCenterCoordinates () -> CLLocationCoordinate2D {
        let latitude = mapView.camera.target.latitude
        let longitude = mapView.camera.target.longitude
        centerMapCoordinate = CLLocationCoordinate2D(latitude:latitude, longitude:longitude)
        return centerMapCoordinate
    }
    
    //Debug function to add a marker to the set coordinates, for debug its set to centre
    func addMarker(centerMapCoordinate: CLLocationCoordinate2D)
    {
        let marker = GMSMarker()
        marker.position = centerMapCoordinate
        marker.map = self.mapView
    }
}



