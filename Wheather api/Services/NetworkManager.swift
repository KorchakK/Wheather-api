//
//  NetworkManager.swift
//  Wheather api
//
//  Created by Konstantin Korchak on 10.04.2022.
//

import Foundation
import UIKit

class NetworkManager {
    
    static let shared = NetworkManager()

    func fetchOpenWeather(lat: String, lon: String, completion: @escaping (OpenWeather) -> Void) {
        
        let staticUrlFirst = "https://api.openweathermap.org/data/2.5/weather?lat="
        let staticUrlMiddle = "&lon="
        let staticUrlLast = "&APPID=f1962e68826f58324d0fb0d9f9cd1ce7&units=metric&lang=ru"
        
        guard let url = URL(string: staticUrlFirst + lat + staticUrlMiddle + lon + staticUrlLast) else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                print(error?.localizedDescription ?? "No description error")
                return
            }
            do {
                let openWeather = try JSONDecoder().decode(OpenWeather.self, from: data)
                DispatchQueue.main.async { completion(openWeather) }
            } catch let error {
                print(error.localizedDescription)
            }
        }.resume()
    }
    
    func fetchImageWeather(idIcon: String, completion: @escaping (UIImage) -> Void) {
        guard let url = URL(string: "https://openweathermap.org/img/wn/" + idIcon + "@2x.png") else { return }
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                print(error?.localizedDescription ?? "No description error")
                return
            }
            guard let image = UIImage(data: data) else {
                return
            }
            DispatchQueue.main.async { completion(image) }
        }.resume()
    }
    
    private init() {}
}
