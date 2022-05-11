import Foundation

func createURLComponents(string url: String, queryItems: [URLQueryItem]?) -> URLComponents? {
  guard var urlComponents = URLComponents(string: url) else {
    return nil
  }

  if queryItems != nil {
    urlComponents.queryItems = queryItems
  }

  return urlComponents
}
