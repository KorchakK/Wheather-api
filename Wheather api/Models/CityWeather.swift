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
    
    var cityWeatherUrl: String { "https://api.openweathermap.org/data/2.5/weather?lat=" +
        lat +
        "&lon=" +
        lon +
        "&APPID=f1962e68826f58324d0fb0d9f9cd1ce7&units=metric&lang=ru"
    }
}

struct OpenWeather {
    let weather: [Conditions]?
    let main: MainWeather?
    
    var labelForecast: String {
        """
        Условия: \(weather?.first?.description ?? "")
        Температура:  \(main?.temp ?? 0) C
        Ощущается как: \(main?.feelsLike ?? 0) С
        Минимум: \(main?.tempMin ?? 0) C
        Максимум: \(main?.tempMax ?? 0) C
        """
    }
    
    init(weather: [Conditions], main: MainWeather) {
        self.weather = weather
        self.main = main
    }
    
    init() {
        weather = nil
        main = nil
    }
    
    static func getOpenWeather(from value: Any) -> OpenWeather {
        guard let data = value as? [String: Any] else { return OpenWeather() }
        
        guard let weatherData = data["weather"] as? [[String: Any]] else { return OpenWeather() }
        let weather = weatherData.compactMap { Conditions(openWeatherData: $0) }
        
        guard let mainData = data["main"] as? [String: Any] else { return OpenWeather() }
        let main = MainWeather(openWeatherData: mainData)
        
        return OpenWeather(weather: weather, main: main)
    }
}

struct Conditions {
    let description: String?
    let icon: String?
    
    var iconUrl: String {
        "https://openweathermap.org/img/wn/" + (icon ?? "01d") + "@2x.png"
    }
    
    init(openWeatherData: [String: Any]) {
        description = openWeatherData["description"] as? String
        icon = openWeatherData["icon"] as? String
    }
}

struct MainWeather {
    let temp: Double?
    let feelsLike: Double?
    let tempMin: Double?
    let tempMax: Double?
    
    init(openWeatherData: [String: Any]) {
        temp = openWeatherData["temp"] as? Double
        feelsLike = openWeatherData["feels_like"] as? Double
        tempMin = openWeatherData["temp_min"] as? Double
        tempMax = openWeatherData["temp_max"] as? Double
    }
}
