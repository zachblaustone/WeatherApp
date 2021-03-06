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
    @IBOutlet weak var dayLow: UILabel!
    @IBOutlet weak var dayHigh: UILabel!
    @IBOutlet weak var mainTemp: UILabel!
    @IBOutlet weak var windSpeed: UILabel!
    @IBOutlet weak var windDirection: UILabel!
    @IBOutlet weak var humidityPercentage: UILabel!
    @IBOutlet weak var weatherDescription: UILabel!
    @IBOutlet weak var weatherIcon: UIImageView!
    @IBOutlet weak var sunRise: UILabel!
    @IBOutlet weak var sunSet: UILabel!
    @IBOutlet weak var cityNAme: UILabel!
    

    
    let locationManager = CLLocationManager()
    var Longitude: Double = 0
    var Latitiude: Double = 0
    var weather: WeatherGetter!
    var weatherAry: [WeatherGetter]!

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
    
    override func viewDidAppear(animated: Bool) {
        locationManager.stopUpdatingLocation()

    }
    
    func updateUI() {
            self.dayLow.text = weather.dayLow
            self.dayHigh.text = weather.dayHigh
            self.mainTemp.text = weather.tempature
            self.windSpeed.text = weather.windSpeed
            self.humidityPercentage.text = weather.humidityPercentage
            self.weatherDescription.text = weather.weatherDescription.capitalizedString
            self.cityNAme.text = weather.cityName
            self.sunRise.text = weather.sunRise
            self.sunSet.text = weather.sunSet
        
        let img = UIImage(named: "\(weather.weatherIcon)")
        weatherIcon.image = img
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
            weather = WeatherGetter(lat: Latitiude, long: Longitude)
            weather.downloadWeatherDetails { () -> () in
                
                self.updateUI()
                
            }

        }
        
        
    }

    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        if let cell = collectionView.dequeueReusableCellWithReuseIdentifier("DayCell", forIndexPath: indexPath) as? TimeCell {
            
//            let time = weatherAry[indexPath.row]
//
//            cell.configureCell(time)
            
            return cell
        } else {
            return UICollectionViewCell()
        }
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 8
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
}
























