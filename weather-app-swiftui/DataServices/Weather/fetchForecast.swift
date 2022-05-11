import Foundation
import Alamofire

func fetchForecast(city: String, completionHandler: @escaping (Forecast?) -> Void) {
  let apiKey = getApiKey()
  let urlString = "http://api.weatherapi.com/v1/forecast.json"

  let queryItems = [
    URLQueryItem(name: "key", value: apiKey),
    URLQueryItem(name: "q", value: city),
    URLQueryItem(name: "days", value: "7"),
    URLQueryItem(name: "aqi", value: "no"),
    URLQueryItem(name: "alerts", value: "no")
  ]

  guard let request = createURLComponents(string: urlString, queryItems: queryItems) else {
    return completionHandler(nil)
  }

  AF.request(request).validate().responseDecodable(of: Forecast.self) { (response) in
    guard let value = response.value else {
      return completionHandler(nil)
    }

    return completionHandler(value)
  }
}
