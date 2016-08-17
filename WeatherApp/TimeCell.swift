//
//  DayOfTheWeekCell.swift
//  WeatherApp
//
//  Created by Zachary Blaustone on 8/10/16.
//  Copyright © 2016 Pryzm. All rights reserved.
//

import UIKit

class TimeCell: UICollectionViewCell {
    
    @IBOutlet weak var weatherImg: UIImageView!
    @IBOutlet weak var dayLbl: UILabel!
    @IBOutlet weak var dayTempLbl: UILabel!
    
    var day: WeatherGetter!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        

        
        
        layer.cornerRadius = 5.0
    }
    
    func configureCell (time: WeatherGetter) {
        

        
    }
    
}
