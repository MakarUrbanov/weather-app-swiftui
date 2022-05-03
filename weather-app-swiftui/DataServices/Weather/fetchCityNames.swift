import Foundation
import Alamofire

func fetchCityNames(searchString: String, completionHandler: @escaping ([FetchedCity]?) -> Void) {
  let apiKey = getApiKey()
  let urlString = "https://api.weatherapi.com/v1/search.json"

  let queryItems = [
    URLQueryItem(name: "key", value: apiKey),
    URLQueryItem(name: "q", value: searchString),
    URLQueryItem(name: "aqi", value: "no")
  ]

  guard let request = createURLComponents(string: urlString, queryItems: queryItems) else {
    return completionHandler(nil)
  }

  AF.request(request).validate().responseDecodable(of: [FetchedCity].self) { (response) in
    guard let value = response.value else {
      return completionHandler(nil)
    }

    return completionHandler(value)
  }
}
