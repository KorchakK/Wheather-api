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
        NetworkManager.shared.fetchOpenWeather(from: city.cityWeatherUrl) { result in
            switch result {
            case .success(let openWeather):
                self.weatherCast.text = openWeather.labelForecast
                let icon = openWeather.weather?.first?.iconUrl ?? "2d"
                NetworkManager.shared.fetchWeatherImage(from: icon) { image in
                    self.weatherImage.image = image
                    self.activityIndicator.stopAnimating()
                }
            case .failure(let error):
                print(error)
            }
        }
    }
}
