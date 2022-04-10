//
//  CitiesDataManager.swift
//  Wheather api
//
//  Created by Konstantin Korchak on 09.04.2022.
//

class CitiesDataManager {
    
    static let shared = CitiesDataManager()
    
    let cities: [City] = [
        City(city: "Москва", cityForLabel: "Москве", lat: "55.75", lon: "37.61"),
        City(city: "Санкт-Петербург", cityForLabel: "Санкт-Петербурге", lat: "59.93", lon: "30.31"),
        City(city: "Екатеринбург", cityForLabel: "Екатеринбурге",  lat: "56.85", lon: "60.61"),
        City(city: "Нижний Новгород", cityForLabel: "Нижнем Новгороде",  lat: "56.32", lon: "44.00"),
        City(city: "Челябинск", cityForLabel: "Челябинске",  lat: "55.15", lon: "61.42"),
        City(city: "Омск", cityForLabel: "Омске",  lat: "54.99", lon: "73.36"),
        City(city: "Ростов-на-Дону", cityForLabel: "Ростове-на-Дону",  lat: "47.23", lon: "39.72"),
        City(city: "Уфа", cityForLabel: "Уфе",  lat: "54.74", lon: "55.96"),
        City(city: "Новосибирск", cityForLabel: "Новосибирске",  lat: "55.04", lon: "82.93"),
        City(city: "Самара", cityForLabel: "Самаре",  lat: "53.20", lon: "50.15"),
        City(city: "Красноярск", cityForLabel: "Красноярске",  lat: "56.01", lon: "92.86")
    ]
    
    private init() {}
}
