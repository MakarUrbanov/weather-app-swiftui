import Foundation
import Alamofire

func fetchCityNames(cityName: String) {
  let apiKey = getApiKey()
  let urlString = "https://api.weatherapi.com/v1/search.json"

  let queryItems = [
    URLQueryItem(name: "key", value: apiKey),
    URLQueryItem(name: "q", value: cityName),
    URLQueryItem(name: "aqi", value: "no")
  ]
}
