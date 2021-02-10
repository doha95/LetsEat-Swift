//
//  MapViewController.swift
//  Let's Eat
//
//  Created by Doha Tubaileh on 9/2/2021.
//

import UIKit;
import MapKit;

class MapViewController: UIViewController, MKMapViewDelegate {
    
    @IBOutlet weak var mapView: MKMapView!;
    let manager = MapDataManager();
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialize();
        
    }
    func initialize () {
        mapView.delegate = self;
        
        manager.fetch { (annotations) in
            addMap(annotations);
        }
    }
    
    func addMap(_ annotations:[RestaurantItem]){
        mapView.setRegion(manager.currentRegion(latDelta: 0.5, longDelta: 0.5), animated: true);
        mapView.addAnnotations(manager.annotations);
    }
    
    // This method returns a custom MKAnnotationView for every MKAnnotation on the map view.
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView?  {
        let identifier = "custompin";
        // checks to see whether the annotation is the user location. If it is, nil is returned, as the user location is not a restaurant location. Otherwise, it goes to the next statement.
        guard !annotation.isKind(of: MKUserLocation.self) else {
            return nil }
        
        var annotationView: MKAnnotationView?;
        
        //        The if statement checks to see whether there are any existing annotations that were initially visible but have been scrolled off the screen. If yes,
        //        the MKAnnotationView instance for that annotation can be reused and is assigned to the annotationView variable. The annotation parameter is assigned to the annotation property of annotationView.
        
        if let customAnnotationView =
            mapView.dequeueReusableAnnotationView(withIdentifier:
                                                    identifier) {
            annotationView = customAnnotationView
            annotationView?.annotation = annotation
        }
        
        //        The else clause is executed if there are no existing MKAnnotationView instances that can be reused. A new MKAnnotationView instance is created with the reuse identifier specified earlier
        //        (custompin). MKAnnotationView is configured with a callout. When you tap MKAnnotationView, a callout bubble will appear showing the title (restaurant name), subtitle (cuisines), and a button.
        
        else {
            let av = MKAnnotationView(annotation: annotation,
                                      reuseIdentifier: identifier)
            av.rightCalloutAccessoryView =
                UIButton(type:.detailDisclosure)
            annotationView = av
        }
        //        This indicates that the MKAnnotationView instance that you just created can display extra information in a callout bubble and sets the custom image to the custom-annotation image stored in Assets.xcassets.
        if let annotationView = annotationView {
            annotationView.canShowCallout = true
            annotationView.image = UIImage(named: "custom-annotation")
        }
        return annotationView
    }
    
    
    
}
