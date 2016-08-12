//
//  ViewController.swift
//  WeatherApp
//
//  Created by Zachary Blaustone on 8/10/16.
//  Copyright © 2016 Pryzm. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, CLLocationManagerDelegate {

    @IBOutlet weak var collection: UICollectionView!
    
    let locationManager = CLLocationManager()
    var Longitude: Double = 0.0
    var Latitiude: Double = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.locationManager.requestAlwaysAuthorization()
        self.locationManager.requestWhenInUseAuthorization()
        
        collection.delegate = self
        collection.dataSource = self
        
        
        if (CLLocationManager.locationServicesEnabled()) {
            
            locationManager.delegate = self;
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.requestAlwaysAuthorization()
            locationManager.startUpdatingLocation()
            
        }
    }
    
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let userLocation:CLLocation = locations[0]
        let long = userLocation.coordinate.longitude;
        let lat = userLocation.coordinate.latitude;
        
        print(long)
        print(lat)
        
        self.Longitude = long
        self.Latitiude = lat
        
        print("Long: \(Longitude) Lat: \(Latitiude)")
        
        if Longitude != 0.0 || Latitiude != 0.0 {
            WeatherGetter(lat: Latitiude, long: Longitude)
        }
        
        
    }

    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        if let cell = collectionView.dequeueReusableCellWithReuseIdentifier("DayCell", forIndexPath: indexPath) as? DayOfTheWeekCell {
            
//            let day = dayOfTheWeek[indexPath.row]
//            
//            cell.configureCell(day)
            
            return cell
        } else {
            return UICollectionViewCell()
        }
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 7
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
}
























