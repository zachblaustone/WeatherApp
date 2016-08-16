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
    private var _humidityPercentage: String!
    private var _windSpeed: String!
    private var _windDirection: Int!
    private var _weatherDescription: String!
    
    var viewController: ViewController!
    var downloaded = false
    
    
    
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
    
    var humidityPercentage: String {
        return _humidityPercentage
    }
    
    var windSpeed: String {
        return _windSpeed
    }
    
    var windDirection: Int {
        return _windDirection
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
    
    func updateUI() {
        if self.downloaded == true {
            viewController.mainTemp.text = self._tempature
        }

    }
    
    
    func timeStringFromUnixTime(unixTime: Double) -> String {
        let date = NSDate(timeIntervalSince1970: unixTime)
        
        let dayTimePeriodFormatter = NSDateFormatter()
        dayTimePeriodFormatter.dateFormat = "MMM dd YYYY hh:mm a"
        
        let dateString = dayTimePeriodFormatter.stringFromDate(date)
        
        print( " _ts value is \(dateString)")
        self._day = dateString
        return dateString
    }
    

    
    func downloadWeatherDetails(lat: Double, long: Double) {
        let url = NSURL(string: "\(URL_BASE)?lat=\(lat)&lon=\(long)&units=imperial&appid=\(URL_PASSWORD)")!
        Alamofire.request(.GET, url).responseJSON { responce in
            let result = responce.result
            
            print("URL : \(url)")
            
            print(result.value.debugDescription)
            
            if let dict = result.value as? Dictionary<String, AnyObject> {
                
                if let main = dict["main"] as? Dictionary<String, AnyObject> {
                    if let temp = main["temp"] as? Int {
                        self._tempature = "\(temp)˚"
                    }
                
                    if let humidity = main["humidity"] as? Int {
                        self._humidityPercentage = "\(humidity)%"
                    }
                    
                    if let tempMin = main["temp_min"] as? Int {
                        self._dayLow = "\(tempMin)˚"
                    }
                    
                    if let tempMax = main["temp_max"] as? Int {
                        self._dayHigh = "\(tempMax)˚"
                    }
                    
                    if let wind = dict["wind"] as? Dictionary<String, AnyObject> {
                        if let speed = wind["speed"] as? Int {
                            self._windSpeed = "\(speed) mph"
                            print(self._windSpeed)
                        }
                        if let deg = wind["deg"] as? Int {
                            self._windDirection = deg
                            print(self._windDirection)
                        }
                    }
                    
                    if let weather = dict["weather"] as? Dictionary<String, Array<String>> {
                        if let desc = weather["main"] as? AnyObject {
                            print(desc)
                        }
                        
                    }
                    
                    if let dateTime = dict["dt"] as? Double {
                        self.timeStringFromUnixTime(dateTime)
                        
                    }
                    
                    self.downloaded = true

                }
            }
            
        }
    }
    
}




