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
    @IBOutlet var activityIndicator: UIActivityIndicatorView!
    
    var city: City!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        activityIndicator.startAnimating()
        activityIndicator.hidesWhenStopped = true
        navigationItem.title = city.welcomeLabel
        NetworkManager.shared.fetchOpenWeather(lat: city.lat, lon: city.lon) { openWeather in
            self.weatherCast.text = openWeather.labelForecast
            let idIcon = openWeather.weather?.first?.icon ?? "04d"
            NetworkManager.shared.fetchImageWeather(idIcon: idIcon) { image in
                self.weatherImage.image = image
                self.activityIndicator.stopAnimating()
            }
        }
    }
}
