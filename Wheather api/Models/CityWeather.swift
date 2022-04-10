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
    
    var labelForecast: String {
        """
        Условия: \(weather?.first?.description ?? "")
        Температура:  \(main?.temp ?? 0) C
        Ощущается как: \(main?.feels_like ?? 0) С
        Минимум: \(main?.temp_min ?? 0) C
        Максимум: \(main?.temp_max ?? 0) C
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
