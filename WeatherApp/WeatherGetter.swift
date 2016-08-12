//
//  WeatherGetter.swift
//  WeatherApp
//
//  Created by Zachary Blaustone on 8/11/16.
//  Copyright © 2016 Pryzm. All rights reserved.
//

import Foundation
import Alamofire

class WeatherGetter {
    
    private var _day: String!
    private var _tempature: String!
    private var _cityID: String!
    private var _cityURL: String!
    private var _dayLow: String!
    private var _dayHigh: String!
    private var _longitude: Double!
    private var _latitude: Double!
    private var _weatherURL: String!
    
    
    
    var day: String {
        return _day
    }
    
    var tempature: String {
        return _tempature
    }
    
    var cityID: String {
        return _cityID
    }
    
    var cityURL: String {
        return _cityURL
    }
    
    var dayLow: String {
        return _dayLow
    }
    
    var dayHigh: String {
        return _dayHigh
    }
    
    var longitude: Double {
        return _longitude
    }
    
    var latitude: Double {
       return _latitude
    }
    
//    init(lat: Double, long: Double) {
//        
//        self._longitude = long
//        self._latitude = lat
//        
//        
//        _weatherURL = "\(URL_BASE)?lat=\(self._latitude)&lon=\(self._longitude)&appid=\(URL_PASSWORD)"
//        
//
//    }
    
    
    

    
    func downloadWeatherDetails(lat: Double, long: Double) {
        let url = NSURL(string: "\(URL_BASE)?lat=\(lat)&lon=\(long)&appid=\(URL_PASSWORD)")!
        Alamofire.request(.GET, url).responseJSON { responce in
            let result = responce.result
            
            print(result.value.debugDescription)
            
        }
    }
    
}










//    func getWeather(lat: Double, long: Double) {
//
//        // pi.openweathermap.org/data/2.5/weather?lat=35&lon=139&appid=b1b15e88fa797225412429c1c50c122a
//
//        // This is a pretty simple networking task, so the shared session will do.
//        let session = NSURLSession.sharedSession()
//
//        let weatherRequestURL = NSURL(string: "\(URL_BASE)?lat=\(lat)&lon=\(long)&appid=\(URL_PASSWORD)")!
//
//        // The data task retrieves the data.
//        let dataTask = session.dataTaskWithURL(weatherRequestURL) {
//            (data: NSData?, response: NSURLResponse?, error: NSError?) in
//            if let error = error {
//                // Case 1: Error
//                // We got some kind of error while trying to get data from the server.
//                print("Error:\n\(error)")
//            }
//            else {
//                // Case 2: Success
//                // We got a response from the server!
//                print("Raw data:\n\(data!)\n")
//                let dataString = String(data: data!, encoding: NSUTF8StringEncoding)
//                print("Human-readable data:\n\(dataString!)")
//
//
//
//            }
//
//
//        }
//
//        // The data task is set up...launch it!
//        dataTask.resume()
//    }
