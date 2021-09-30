//
//  ViewController.swift
//  Map
//
//  Created by dev on 2021/09/30.
//

import UIKit
import MapKit

class ViewController: UIViewController, CLLocationManagerDelegate {
    @IBOutlet var myMap: MKMapView!
    
    @IBOutlet var lblLocationInfo1: UILabel!
    @IBOutlet var lblLocationInfo2: UILabel!
    
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        lblLocationInfo1.text = ""
        lblLocationInfo2.text = ""
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        myMap.showsUserLocation = true
    }
    
    func goLocation(latitudeValue: CLLocationDegrees, longitudeValue: CLLocationDegrees, delta span: Double) -> CLLocationCoordinate2D {
        let pLocation = CLLocationCoordinate2D(latitude: latitudeValue, longitude: longitudeValue)
        let spanValue = MKCoordinateSpan(latitudeDelta: span, longitudeDelta: span)
        let pRegion = MKCoordinateRegion(center: pLocation, span: spanValue)
        myMap.setRegion(pRegion, animated: true)
        return pLocation
    }
    
    func setAnnotation(latitudeValue: CLLocationDegrees, longtitudeValue: CLLocationDegrees, delta span: Double, title strTitle: String, subtitle strSubtitle: String) {
        let annotation = MKPointAnnotation()
        annotation.coordinate = goLocation(latitudeValue: latitudeValue, longitudeValue: longtitudeValue, delta: span)
        annotation.title = strTitle
        annotation.subtitle = strSubtitle
        myMap.addAnnotation(annotation)
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let pLocation = locations.last
        _ = goLocation(latitudeValue: (pLocation?.coordinate.latitude)!, longitudeValue: (pLocation?.coordinate.longitude)!, delta: 0.01)
        CLGeocoder().reverseGeocodeLocation(pLocation!, completionHandler: {
            (placemark, error) -> Void in
            let pm = placemark!.first
            let country = pm!.country
            var address: String = country!
            if pm!.locality != nil {
                address += " "
                address += pm!.locality!
            }
            if pm!.thoroughfare != nil {
                address += " "
                address += pm!.thoroughfare!
            }
            self.lblLocationInfo1.text = "현재 위치"
            self.lblLocationInfo2.text = address
        })
        locationManager.stopUpdatingLocation()
    }

    @IBAction func sgChangeLocation(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            self.lblLocationInfo1.text = ""
            self.lblLocationInfo2.text = ""
            locationManager.startUpdatingLocation()
        case 1:
            setAnnotation(latitudeValue: 37.751853, longtitudeValue: 128.87605740000004, delta: 1, title: "한국폴리텍대학 강릉캠퍼스", subtitle: "강원도 강릉시 남산초교길 121")
            self.lblLocationInfo1.text = "보고 계신 위치"
            self.lblLocationInfo2.text = "한국폴리텍대학 강릉캠퍼스"
        case 2:
            setAnnotation(latitudeValue: 37.556876, longtitudeValue: 126.914066, delta: 0.1, title: "이지스 퍼블리싱", subtitle: "서울시 마포구 잔다리로 109 이지스 빌딩")
            self.lblLocationInfo1.text = "보고 계신 위치"
            self.lblLocationInfo2.text = "이지스퍼블리싱 출판사"
        case 3:
            // 37.538113, 126.967477
            setAnnotation(latitudeValue: 37.538113, longtitudeValue: 126.967477, delta: 0.1, title: "나의 하우스", subtitle: "서울시 용산구 원효로1가 근방")
            self.lblLocationInfo1.text = "보고 계신 위치"
            self.lblLocationInfo2.text = "우리집"
        default:
            print("d")
        }
    }
    
}

