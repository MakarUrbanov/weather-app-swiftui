import Foundation
import Alamofire

func fetchWeather(city: String, completionHandler: @escaping (RealtimeWeather?) -> Void) {
  let apiKey = getApiKey()
  let urlString = "https://api.weatherapi.com/v1/current.json"

  let queryItems = [
    URLQueryItem(name: "key", value: apiKey),
    URLQueryItem(name: "q", value: city),
    URLQueryItem(name: "aqi", value: "no")
  ]

  guard let request = createURLComponents(string: urlString, queryItems: queryItems) else {
    return completionHandler(nil)
  }

  AF.request(request).validate().responseDecodable(of: RealtimeWeather.self) { (response) in
    guard let value = response.value else {
      return completionHandler(nil)
    }

    return completionHandler(value)
  }
}
