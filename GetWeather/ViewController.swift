//
//  ViewController.swift
//  GetWeather
//
//  Created by jiaqi guo on 2016-07-16.
//  Copyright © 2016 jiaqi guo. All rights reserved.
//

import UIKit

class ViewController: UIViewController, WeatherServiceDelegate {
    
    
    let weatherService = WeatherService()
    

    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var IconImage: UIImageView!
    
    @IBAction func setCityTapped(sender: UIButton) {
        print ("City Button Tapped")
        openCityAlert()
    }
    
    func openCityAlert() {
        let alert = UIAlertController(title: "City",
        message: "Enter city name",
        preferredStyle: UIAlertControllerStyle.Alert)
        
        
    let ok = UIAlertAction(title: "OK",
        style: UIAlertActionStyle.Default) { (action:UIAlertAction) -> Void in print ("OK")
        
        let textField = alert.textFields?[0]
        print (textField?.text)
        self.cityLabel.text = textField?.text!
        let cityName = textField?.text!
        self.weatherService.getWeather(cityName!)
        }
        
    let cancel = UIAlertAction(title: "Cancel",
                               style: UIAlertActionStyle.Cancel,
                               handler: nil)
        
        
        
        alert.addAction(cancel)
        alert.addAction(ok)
        
        
        // add text field 
        
        alert.addTextFieldWithConfigurationHandler { (textField: UITextField) -> Void in
            textField.placeholder = "City Name"
        }
        
        self.presentViewController(alert, animated: true, completion: nil)
        
    }
    
    
    // MARK: - Weather Service Delegate 
    
    
    func setWeather(weather: Weather) {
        
        print ("###### set Weather")
        print ("City: \(weather.cityName) temp: \(weather.temp) description: \(weather.description)")
        cityLabel.text = weather.cityName
        tempLabel.text = "\(weather.temp)"
        descriptionLabel.text = weather.description
        IconImage.image = UIImage(named: weather.icon)
    }
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.weatherService.delegate = self
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

