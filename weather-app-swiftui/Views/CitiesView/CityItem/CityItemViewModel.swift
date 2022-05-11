import Foundation

class CityItemViewModel: ObservableObject {
  @Published var city: City
  var isNeedUpdate = false

  init(city: City) {
    let lastUpdatedTime = city.lastUpdatedTime
    isNeedUpdate = Date().timeIntervalSince1970 - Double(lastUpdatedTime) >= MAX_NON_UPDATED_TIME
    self.city = city
  }

  func getFormattedTime() -> String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "YYYY-MM-DD HH:mm"

    guard let date = dateFormatter.date(from: city.location.localtime) else {
      return ""
    }

    dateFormatter.dateFormat = "HH:mm"
    return dateFormatter.string(from: date)
  }

  func getTemperature() -> String {
    if let tempC = city.weather?.tempC {
      let tempCInt = Int(floor(tempC))
      return String(tempCInt)
    }

    return "Error"
  }

  func getTemperatureFeelsLike() -> String {
    if let feelslikeC = city.weather?.feelslikeC {
      let feelslikeCInt = Int(floor(feelslikeC))
      return String(feelslikeCInt)
    }

    return "Error"
  }
}
