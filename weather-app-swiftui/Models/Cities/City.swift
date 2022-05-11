import Foundation

struct City: Codable, Identifiable {
  var id: String
  var lastUpdatedTime = Date().timeIntervalSince1970
  var location: RealtimeWeatherLocation
  var weather: RealtimeWeatherCurrent?

  init(city: RealtimeWeather) {
    self.id = "\(city.location.lat)\(city.location.lon)"
    self.location = city.location
    self.weather = city.current
  }
}
