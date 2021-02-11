//
//  MapViewController.swift
//  Let's Eat
//
//  Created by Doha Tubaileh on 9/2/2021.
//

import UIKit;
import MapKit;

class MapViewController: UIViewController {
    
    @IBOutlet weak var mapView: MKMapView!;
    
    let manager = MapDataManager();
    var selectedRestaurant : RestaurantItem?;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialize();
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        switch segue.identifier! {
        case Segue.showDetail.rawValue:
            showRestaurantDetail(segue: segue)
        default:
            print("Segue not added")
        }
    }
   
}

//MARK: Private Extension
private extension MapViewController {
    
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
    
    
    func showRestaurantDetail(segue:UIStoryboardSegue){
        if let viewcontroller = segue.destination as? RestaurantDetailViewController, let resturant = selectedRestaurant {
            viewcontroller.selectedRestaurant = resturant;
        }
    }
}

//MARK: MKMapViewDelegate
extension MapViewController: MKMapViewDelegate {
    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl){
        guard let annotation = mapView.selectedAnnotations.first else {
            return;
        }
        selectedRestaurant = annotation as? RestaurantItem;
        self.performSegue(withIdentifier: Segue.showDetail.rawValue, sender: self);
    }
    
    // This method returns a custom MKAnnotationView for every MKAnnotation on the map view.
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView?  {
        let identifier = "custompin";
        
        guard !annotation.isKind(of: MKUserLocation.self) else {
            return nil }
        
        var annotationView: MKAnnotationView?;
        
        if let customAnnotationView =
            mapView.dequeueReusableAnnotationView(withIdentifier:
                                                    identifier) {
            annotationView = customAnnotationView
            annotationView?.annotation = annotation
        }
        
        else {
            let av = MKAnnotationView(annotation: annotation,
                                      reuseIdentifier: identifier)
            av.rightCalloutAccessoryView = UIButton(type:.detailDisclosure);
            annotationView = av;
        }
        if let annotationView = annotationView {
            annotationView.canShowCallout = true
            annotationView.image = UIImage(named: "custom-annotation")
        }
        return annotationView
    }
    
}
