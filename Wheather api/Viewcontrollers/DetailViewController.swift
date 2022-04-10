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
    private var openWeather = OpenWeather(weather: nil, main: nil)

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = city.welcomeLabel
        NetworkManager.shared.fetchOpenWeather(lat: city.lat, lon: city.lon) { openWeather in
            DispatchQueue.main.async {
                self.openWeather = openWeather
            }
        }
        weatherCast.text = openWeather.labelTest
    }
}
