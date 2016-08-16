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
    private var _weatherIcon: String!
    
    var viewController: ViewController!
    var downloaded = false
    
    
    
    var day: String {
        if _day == nil {
            _day = ""
        }
        return _day
    }
    
    var tempature: String {
        if _tempature == nil {
            _tempature = ""
        }
        return _tempature
    }
    
    var cityID: String {
        if _cityID == nil {
            _cityID = ""
        }
        return _cityID
    }
    
    var cityURL: String {
        if _cityURL == nil {
            _cityURL = ""
        }
        return _cityURL
    }
    
    var dayLow: String {
        if _dayLow == nil {
            _dayLow = ""
        }
        return _dayLow
    }
    
    var dayHigh: String {
        if _dayHigh == nil {
            _dayHigh = ""
        }
        return _dayHigh
    }
    
    var longitude: Double {
        if _longitude == nil {
            _longitude = 0.0
        }
        return _longitude
    }
    
    var latitude: Double {
        if _latitude == nil {
            _latitude = 0.0
        }
       return _latitude
    }
    
    var humidityPercentage: String {
        if _humidityPercentage == nil {
            _humidityPercentage = ""
        }
        return _humidityPercentage
    }
    
    var windSpeed: String {
        if _windSpeed == nil {
            _windSpeed = ""
        }
        return _windSpeed
    }
    
    var windDirection: Int {
        if _windDirection == nil {
            _windDirection = 0
        }
        return _windDirection
    }
    
    var weatherDescription: String {
        if _weatherDescription == nil {
            _weatherDescription = ""
        }
        return _weatherDescription
    }
    
    var weatherIcon: String {
        if _weatherIcon == nil {
            _weatherIcon = "01d"
        }
        return _weatherIcon
    }
    
    init(lat: Double, long: Double) {
        
        self._longitude = long
        self._latitude = lat
        
        
        _weatherURL = "\(URL_BASE)?lat=\(self._latitude)&lon=\(self._longitude)&units=imperial&appid=\(URL_PASSWORD)"
        
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
    
    func windDirection(degreeDirection: Int) {
        

        

    }
    

    
    func downloadWeatherDetails(complete: DownloadComplete) {
        let url = NSURL(string: _weatherURL)!
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
                            
                        }
                        if let deg = wind["deg"] as? Int {
                            self.windDirection(deg)
                        }
                    }
                    
                    if let weather = dict["weather"] as? [Dictionary<String, AnyObject>] {
                        if let desc = weather[0]["description"] as? String {
                            self._weatherDescription = desc
                        }
                        if let icon = weather[0]["icon"] as? String {
                            if icon != "" {
                                print(icon)
                                self._weatherIcon = icon
                            }

                        }
                        
                    }
                    
                    if let dateTime = dict["dt"] as? Double {
                        self.timeStringFromUnixTime(dateTime)
                        
                    }
                    


                }
            }
            complete()
        } 
    }
    
}




