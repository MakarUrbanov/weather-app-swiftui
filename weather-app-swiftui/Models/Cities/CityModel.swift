import Foundation

struct CityModel: Codable, Identifiable {
  var id: String
  var lastUpdatedTime = Date().timeIntervalSince1970
  var location: LocationStruct
  var weather: CurrentStruct?

  init(city: RealtimeWeatherStruct) {
    self.id = "\(city.location.lat)\(city.location.lon)"
    self.location = city.location
    self.weather = city.current
  }
}
