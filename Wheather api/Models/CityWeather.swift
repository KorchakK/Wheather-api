//
//  CityWeather.swift
//  Wheather api
//
//  Created by Konstantin Korchak on 09.04.2022.
//

struct City {
    let city: String
    let cityForLabel: String
    let lat: String
    let lon: String
    
    var welcomeLabel: String {
        "Погода в \(cityForLabel)"
    }
}

struct OpenWeather: Decodable {
    let weather: [Conditions]?
    let main: MainWeather?
    
    var labelTest: String {
        """
        \(weather?.first?.description ?? "error")
        \(main?.temp ?? 0)
        \(main?.feels_like ?? 0)
        """
    }
}

struct Conditions: Decodable {
    let description: String?
    let icon: String?
}

struct MainWeather: Decodable {
    let temp: Double?
    let feels_like: Double?
    let temp_min: Double?
    let temp_max: Double?
}
