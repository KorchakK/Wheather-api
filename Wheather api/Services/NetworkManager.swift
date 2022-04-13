//
//  NetworkManager.swift
//  Wheather api
//
//  Created by Konstantin Korchak on 10.04.2022.
//

import Foundation
import Alamofire
import UIKit

class NetworkManager {
    
    static let shared = NetworkManager()
    
    private init() {}
    
    func fetchOpenWeather(from url: String, completion: @escaping(Result<OpenWeather, AFError>) -> Void) {
        AF.request(url)
            .validate()
            .responseJSON { dataResponse in
                switch dataResponse.result {
                case .success(let value):
                    let openWeather = OpenWeather.getOpenWeather(from: value)
                    completion(.success(openWeather))
                case .failure(let error):
                    print(error)
                    completion(.failure(AFError.responseValidationFailed(reason: .dataFileNil)))
                }
            }
    }
    
    func fetchWeatherImage(from url: String, completion: @escaping(UIImage) -> Void) {
        AF.request(url)
            .validate()
            .responseData { data in
                switch data.result {
                case .success(let data):
                    guard let image = UIImage(data: data) else { return }
                    completion(image)
                case .failure(let error):
                    print(error)
                }
            }
    }
}
