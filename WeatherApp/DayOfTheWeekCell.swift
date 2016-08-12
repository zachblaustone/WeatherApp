//
//  DayOfTheWeekCell.swift
//  WeatherApp
//
//  Created by Zachary Blaustone on 8/10/16.
//  Copyright © 2016 Pryzm. All rights reserved.
//

import UIKit

class DayOfTheWeekCell: UICollectionViewCell {
    
    @IBOutlet weak var weatherImg: UIImageView!
    @IBOutlet weak var dayLbl: UILabel!
    @IBOutlet weak var dayTempLbl: UILabel!
    
    var day: WeatherGetter!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        
//        weatherImg.image = day.image
//        dayLbl.text = day.day
//        dayTempLbl.text = day.tempature
        
        
        layer.cornerRadius = 5.0
    }
    
    func configureCell (day: WeatherGetter) {
        self.day = day
//        
//        dayLbl.text = self.day.day.capitalizedString
//        dayTempLbl.text = self.day.tempature
//        weatherImg.image = UIImage(named: "rain")
//        
    }
    
}
