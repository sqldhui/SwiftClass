//
//  ViewController.swift
//  SwiftClassP2C11
//
//  Created by apple on 15/6/30.
//  Copyright (c) 2015年 lh. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit

class ViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate {

    let locationManager: CLLocationManager = CLLocationManager()
    
    var longitudeTxt: UITextField!
    var latitudeTxt: UITextField!
    var heightTxt: UITextField!
    
    var mapView: MKMapView!
    
    var currLocation: CLLocation!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.lightGrayColor()
        // Do any additional setup after loading the view, typically from a nib.
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.distanceFilter = 2
        locationManager.requestAlwaysAuthorization()
        
        longitudeTxt = UITextField(frame: CGRectMake(20, 20, self.view.frame.size.width - 40, 20))
        longitudeTxt.backgroundColor = UIColor.whiteColor()
        self.view.addSubview(longitudeTxt)
        
        latitudeTxt = UITextField(frame: CGRectMake(20, 60, self.view.frame.size.width - 40, 20))
        latitudeTxt.backgroundColor = UIColor.whiteColor()
        self.view.addSubview(latitudeTxt)
        
        heightTxt = UITextField(frame: CGRectMake(20, 100, self.view.frame.size.width - 40, 20))
        heightTxt.backgroundColor = UIColor.whiteColor()
        self.view.addSubview(heightTxt)
        
        var location1 = CLLocation(latitude: 53.204525, longitude: 50.111751)
        var location2 = CLLocation(latitude: 53.203715, longitude: 50.160374)
        var distance: CLLocationDistance = location1.distanceFromLocation(location2)
        println("distance: \(distance)")
        
//        self.locationBianMa()
        
        mapView = MKMapView(frame: CGRectMake(20, 150, self.view.frame.size.width - 40, self.view.frame.size.height - 160))
        mapView.delegate = self
        self.view.addSubview(mapView)
        
        var latDelta = 0.05
        var longDelta = 0.05
        var currentLocationSpan: MKCoordinateSpan = MKCoordinateSpanMake(latDelta, longDelta)
        var currentRegion: MKCoordinateRegion = MKCoordinateRegionMake(locationManager.location.coordinate, currentLocationSpan)
        mapView.setRegion(currentRegion, animated: true)
        mapView.mapType = .Hybrid
        
        var objectAnnotation = MKPointAnnotation()
        objectAnnotation.coordinate = locationManager.location.coordinate
        objectAnnotation.title = "北京海淀"
        objectAnnotation.subtitle = "北三环"
        mapView.addAnnotation(objectAnnotation)
    }
    
    func locationManager(manager: CLLocationManager!, didChangeAuthorizationStatus status: CLAuthorizationStatus)
    {
        locationManager.startUpdatingLocation()
        locationManager.startUpdatingHeading()
        println("定位开启")
    }
    
    func locationManager(manager: CLLocationManager!, didUpdateLocations locations: [AnyObject]!)
    {
        currLocation = locations.last as! CLLocation
//        self.reverseGeocode()
//        locationManager.stopUpdatingLocation()
//        locationManager.stopUpdatingHeading()
        longitudeTxt.text = "\(currLocation.coordinate.longitude)"
        latitudeTxt.text = "\(currLocation.coordinate.latitude)"
        heightTxt.text = "\(currLocation.altitude)"
    }
    
    func locationManager(manager: CLLocationManager!, didUpdateHeading newHeading: CLHeading!)
    {
//        println("\(newHeading.trueHeading) degress(true), \(newHeading.magneticHeading) degress(magnetic)")
    }
    
    func locationManager(manager: CLLocationManager!, didFailWithError error: NSError!)
    {
        println((error))
        
        if let clErr = CLError(rawValue: error.code)
        {
            switch clErr
            {
            case .LocationUnknown:
                println("位置不明")
            case .Denied:
                println("允许检索位置被拒绝")
            case .Network:
                println("用于检索位置的网络不可用")
            default:
                println("未知的位置错误")
            }
        }
        else
        {
            println("其他错误")
        }
    }
    
    func reverseGeocode()
    {
        var geocoder = CLGeocoder()
        var p: CLPlacemark?
        geocoder.reverseGeocodeLocation(currLocation, completionHandler:
        {
            (placemarks, error) -> Void in
            var array = NSArray(object: "zh-hans")
            NSUserDefaults.standardUserDefaults().setObject(array, forKey: "AppleLanguages")
            if error != nil
            {
                println("reverse geodcode fail: \(error.localizedDescription)")
                return
            }
            let pm = placemarks as! [CLPlacemark]
            if pm.count > 0
            {
                p = placemarks[0] as? CLPlacemark
                println((p))
            }
            else
            {
                println("no placemarks")
            }
        })
    }
    
    func locationBianMa()
    {
        var geocoder = CLGeocoder()
        var p: CLPlacemark?
        geocoder.geocodeAddressString("北京市海淀区北三环西路39号", completionHandler:
        {
            (placemarks, error) -> Void in
            if error != nil
            {
                println("reverse geodcode fail: \(error.localizedDescription)")
                return
            }
            let pm = placemarks as! [CLPlacemark]
            if pm.count > 0
            {
                p = placemarks[0] as? CLPlacemark
                println("longitude = \(p?.location.coordinate.longitude)")
                println("latitude = \(p?.location.coordinate.latitude)")
                println((p))
            }
            else
            {
                println("no placemarks")
            }
        })
    }
    
    func mapView(mapView: MKMapView!, viewForAnnotation annotation: MKAnnotation!) -> MKAnnotationView!
    {
        if annotation is MKUserLocation
        {
            return nil
        }
         let reuseId = "pin"
        var pinView = mapView.dequeueReusableAnnotationViewWithIdentifier(reuseId) as? MKPinAnnotationView
        if pinView == nil
        {
            pinView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: reuseId)
            pinView!.canShowCallout = true
            pinView!.animatesDrop = true
            pinView!.pinColor = .Purple
            pinView!.rightCalloutAccessoryView = UIButton.buttonWithType(.DetailDisclosure) as! UIButton
        }
        else
        {
            pinView!.annotation = annotation
        }
        return pinView
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

