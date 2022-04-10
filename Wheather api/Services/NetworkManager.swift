//
//  NetworkManager.swift
//  Wheather api
//
//  Created by Konstantin Korchak on 10.04.2022.
//

import Foundation

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
                completion(openWeather)
            } catch let error {
                print(error.localizedDescription)
            }
        }.resume()
    }
}
