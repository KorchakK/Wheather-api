//
//  DetailViewController.swift
//  Wheather api
//
//  Created by Konstantin Korchak on 09.04.2022.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet var weatherImage: UIImageView!
    @IBOutlet var weatherCast: UILabel!
    
    var city: City!

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = city.welcomeLabel
        NetworkManager.shared.fetchOpenWeather(lat: city.lat, lon: city.lon) { openWeather in
            DispatchQueue.main.async {
                self.weatherCast.text = openWeather.labelTest
            }
        }
        
    }
}
