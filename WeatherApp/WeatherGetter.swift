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
    
    var viewController: ViewController!
    var downloaded = false

    
    
    private var _day: String!
    private var _tempature: String!
    private var _cityID: String!
    private var _cityURL: String!
    private var _dayLow: String!
    private var _dayHigh: String!
    private var _longitude: Double!
    private var _latitude: Double!
    private var _weatherURL: String!
    private var _weatherURLWeather: String!
    private var _humidityPercentage: String!
    private var _windSpeed: String!
    private var _windDirection: Int!
    private var _weatherDescription: String!
    private var _weatherIcon: String!
    private var _cityName: String!
    private var _sunRise: String!
    private var _sunSet: String!

    private var _secondTime: String!
    private var _thirdTime: String!
    private var _forthTime: String!
    private var _fifthTime: String!
    private var _sixthTime: String!
    private var _seventhTime: String!
    private var _eighthTime: String!
    
    private var _secondTemp: String!
    private var _thirdTemp: String!
    private var _forthTemp: String!
    private var _fifthTemp: String!
    private var _sixthTemp: String!
    private var _seventhTemp: String!
    private var _eighthTemp: String!
    
    private var _secondIcon: String!
    private var _thirdIcon: String!
    private var _forthIcon: String!
    private var _fifthIcon: String!
    private var _sixthIcon: String!
    private var _seventhIcon: String!
    private var _eighthIcon: String!
    
    var sunSet: String {
        if _sunSet == nil {
            _sunSet = ""
        }
        return _sunSet
    }
    
    var sunRise: String {
        if _sunRise == nil {
            _sunRise = ""
        }
        return _sunRise
    }
    
    var secondIcon: String {
        if _secondIcon == nil {
            _secondIcon = ""
        }
        return _secondIcon
    }
    
    var thirdIcon: String {
        if _thirdIcon == nil {
            _thirdIcon = ""
        }
        return _thirdIcon
    }
    
    var forthIcon: String {
        if _forthIcon == nil {
            _forthIcon = ""
        }
        return _forthIcon
    }
    
    var fifthIcon: String {
        if _fifthIcon == nil {
            _fifthIcon = ""
        }
        return _fifthIcon
    }
    
    var sixthIcon: String {
        if _sixthIcon == nil {
            _sixthIcon = ""
        }
        return _sixthIcon
    }
    
    var seventhIcon: String {
        if _seventhIcon == nil {
            _seventhIcon = ""
        }
        return _seventhIcon
    }
    
    var eighthIcon: String {
        if _eighthIcon == nil {
            _eighthIcon = ""
        }
        return _eighthIcon
    }
    
    
    var secondTime: String {
        if _secondTime == nil {
            _secondTime = ""
        }
        return _secondTime
    }
    
    var thirdTime: String {
        if _thirdTime == nil {
            _thirdTime = ""
        }
        return _thirdTime
    }
    
    var forthTime: String {
        if _forthTime == nil {
            _forthTime = ""
        }
        return _forthTime
    }
    
    var fifthTime: String {
        if _fifthTime == nil {
            _fifthTime = ""
        }
        return _fifthTime
    }
    
    var sixthTime: String {
        if _sixthTime == nil {
            _sixthTime = ""
        }
        return _sixthTime
    }
    
    var seventhTime: String {
        if _seventhTime == nil {
            _seventhTime = ""
        }
        return _seventhTime
    }
    
    var eighthTime: String {
        if _eighthTime == nil {
            _eighthTime = ""
        }
        return _eighthTime
    }
    
    var secondTemp: String {
        if _secondTemp == nil {
            _secondTemp = ""
        }
        return _secondTemp
    }
    
    var thirdTemp: String {
        if _thirdTemp == nil {
            _thirdTemp = ""
        }
        return _thirdTemp
    }
    
    var forthTemp: String {
        if _forthTemp == nil {
            _forthTemp = ""
        }
        return _forthTemp
    }
    
    var fifthTemp: String {
        if _fifthTemp == nil {
            _fifthTemp = ""
        }
        return _fifthTemp
    }
    
    var sixthTemp: String {
        if _fifthTemp == nil {
            _fifthTemp = ""
        }
        return _fifthTemp
    }
    
    var seventhTemp: String {
        if _seventhTemp == nil {
            _seventhTemp = ""
        }
        return _seventhTemp
    }
    
    var eighthTemp: String {
        if _eighthTemp == nil {
            _eighthTemp = ""
        }
        return _eighthTemp
    }
    
    
    
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
    
    var cityName: String {
        if _cityName == nil {
            _cityName = ""
        }
        return _cityName
    }
    
    init(lat: Double, long: Double) {
        
        self._longitude = long
        self._latitude = lat
        
        
        _weatherURL = "\(URL_BASE)?lat=\(self._latitude)&lon=\(self._longitude)&units=imperial&appid=\(URL_PASSWORD)"
        _weatherURLWeather = "\(URL_BASE_WEATHER)?lat=\(self._latitude)&lon=\(self._longitude)&units=imperial&appid=\(URL_PASSWORD)"
        
    }
    
    func timeStringFromUnixTimeSunset(unixTime: Double) -> String {
        let date = NSDate(timeIntervalSince1970: unixTime)
        
        let dayTimePeriodFormatter = NSDateFormatter()
        dayTimePeriodFormatter.dateFormat = "hh:mm a"
        
        let dateString = dayTimePeriodFormatter.stringFromDate(date)
        
        print( " _ts value is \(dateString)")
        self._sunSet = "Sunset: \(dateString)"
        return dateString
    }
    
    func timeStringFromUnixTimeSunRise(unixTime: Double) -> String {
        let date = NSDate(timeIntervalSince1970: unixTime)
        
        let dayTimePeriodFormatter = NSDateFormatter()
        dayTimePeriodFormatter.dateFormat = "hh:mm a"
        
        let dateString = dayTimePeriodFormatter.stringFromDate(date)
        
        print( " _ts value is \(dateString)")
        self._sunRise = "Sunrise: \(dateString)"
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
                
                if let city = dict["city"] as? Dictionary<String, AnyObject> {
                    if let name = city["name"] as? String {
                        print(name)
                        self._cityName = name
                    }
                }
                
                if let list = dict["list"] as? [Dictionary<String, AnyObject>] {
                    if let main = list[0]["main"] as? Dictionary<String, AnyObject> {
                        if let temp = main["temp"] as? Int {
                            print("temp")
                            print(temp)
                            self._tempature = "\(temp)˚"
                        }
                        
                        if let humidity = main["humidity"] as? Int {
                            print("humidity")
                            print(humidity)
                            self._humidityPercentage = "\(humidity)%"
                    }
                        if let tempMin = main["temp_min"] as? Int {
                            print("tempMin")
                            print(tempMin)
                            self._dayLow = "\(tempMin)˚"

                
                    }
                        if let tempMax = main["temp_max"] as? Int {
                            print("tempMax")
                            print(tempMax)
                            self._dayHigh = "\(tempMax)˚"
                        }
                        
                        
                        if let weather = list[0]["weather"] as? [Dictionary<String, AnyObject>] {
                            if let desc = weather[0]["description"] as? String {
                                
                                print(desc)
                                self._weatherDescription = desc
                            }
                            if let icon = weather[0]["icon"] as? String {
                                if icon != "" {
                                    self._weatherIcon = icon
                            }
                            }
                            if let weather = list[1]["weather"] as? [Dictionary<String, AnyObject>] {
                                if let iconTwo = weather[0]["icon"] as? String {
                                    if iconTwo != "" {
                                        print(iconTwo)
                                        self._secondIcon = iconTwo
                                    }
                                    
                            }
                            
                            }
                            if let weather = list[2]["weather"] as? [Dictionary<String, AnyObject>] {
                                if let iconThree = weather[0]["icon"] as? String {
                                    if iconThree != "" {
                                        print(iconThree)
                                        self._thirdIcon = iconThree
                                    }
                            }
                                
                            }
                            if let weather = list[3]["weather"] as? [Dictionary<String, AnyObject>] {
                                if let iconFour = weather[0]["icon"] as? String {
                                    if iconFour != "" {
                                        print(iconFour)
                                        self._forthIcon = iconFour
                                    }
                                    
                                }
                            }
                            if let weather = list[4]["weather"] as? [Dictionary<String, AnyObject>] {
                                if let iconFive = weather[0]["icon"] as? String {
                                    if iconFive != "" {
                                        print(iconFive)
                                        self._fifthIcon = iconFive
                                    }
                                    
                                }
                            }
                            if let weather = list[5]["weather"] as? [Dictionary<String, AnyObject>] {
                                if let iconSix = weather[0]["icon"] as? String {
                                    if iconSix != "" {
                                        print(iconSix)
                                        self._sixthIcon = iconSix
                                    }
                                    
                                }
                            }
                            if let weather = list[6]["weather"] as? [Dictionary<String, AnyObject>] {
                                if let iconSeven = weather[0]["icon"] as? String {
                                    if iconSeven != "" {
                                        print(iconSeven)
                                        self._seventhIcon = iconSeven
                                    }
                                    
                                }
                            }
                            if let weather = list[7]["weather"] as? [Dictionary<String, AnyObject>] {
                                if let iconEight = weather[0]["icon"] as? String {
                                    if iconEight != "" {
                                        print(iconEight)
                                        self._eighthIcon = iconEight
                                    }
                                    
                                }
                            }
                            
                            
                        }
                        
                    }
                    
                    if let wind = list[0]["wind"] as? Dictionary<String, AnyObject> {
                        if let speed = wind["speed"] as? Int {
                            print("speed")
                            print(speed)
                            self._windSpeed = "\(speed) mph"
                            
                        }
                        if let deg = wind["deg"] as? Int {
                            print("deg")
                            print(deg)
                            self.windDirection(deg)
                        }
                    }
                    
                    
                    if let dateTime = list[0]["dt"] as? Double {
                        print("dateTime")
                        print(dateTime)
                        
                    }
                    


                }
            }
            let urlWeather = NSURL(string: self._weatherURLWeather)!
            Alamofire.request(.GET, urlWeather).responseJSON { responce in
                let result = responce.result
                
                print("URL : \(urlWeather)")
                
                print(result.value.debugDescription)
                
                
                if let dict = result.value as? Dictionary<String, AnyObject> {
                    if let sunSet = dict["sys"] as? Dictionary<String, AnyObject> {
                        if let sunRise = sunSet["sunrise"] as? Double {
                            print(sunRise)
                            self.timeStringFromUnixTimeSunRise(sunRise)
                        }
                    }
                    if let sunSet2 = dict["sys"] as? Dictionary<String, AnyObject> {
                        if let sunset = sunSet2["sunset"] as? Double {
                            print(sunset)
                            self.timeStringFromUnixTimeSunset(sunset)
                        }
                    }
                    print(self.sunRise)
                    print(self.sunSet)
                }
            
            complete()
        }
        }
    }
    
}




