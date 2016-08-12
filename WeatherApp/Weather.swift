//
//  DayOfTheWeek.swift
//  WeatherApp
//
//  Created by Zachary Blaustone on 8/10/16.
//  Copyright © 2016 Pryzm. All rights reserved.
//

import Foundation
import Alamofire

class Weather {
    
    private var _day: String!
    private var _tempature: String!
    private var _dayImage: UIImageView!
    private var _cityID: String!
    private var _cityURL: String!
    private var _dayLow: String!
    private var _dayHigh: String!
    
    
    
    
    
    var day: String {
        return _day
    }
    
    var tempature: String {
        return _tempature
    }
    
    var dayImage: UIImageView {
        return _dayImage
    }
    
    var cityID: String {
        return _cityID
    }
    
    init(cityID: String) {
        self._cityID = cityID
        
    
    func getWeather(cityID: String) {
            
            // This is a pretty simple networking task, so the shared session will do.
            let session = NSURLSession.sharedSession()
            
            let weatherRequestURL = NSURL(string: "\(URL_BASE)?id=\(cityID)&appid=\(URL_PASSWORD)")!
            
            // The data task retrieves the data.
            let dataTask = session.dataTaskWithURL(weatherRequestURL) {
                (data: NSData?, response: NSURLResponse?, error: NSError?) in
                if let error = error {
                    // Case 1: Error
                    // We got some kind of error while trying to get data from the server.
                    print("Error:\n\(error)")
                }
                else {
                    // Case 2: Success
                    // We got a response from the server!
                    print("Raw data:\n\(data!)\n")
                    let dataString = String(data: data!, encoding: NSUTF8StringEncoding)
                    print("Human-readable data:\n\(dataString!)")
                }
                
                
            }
            
            // The data task is set up...launch it!
            dataTask.resume()
        }
    }
    
}


















