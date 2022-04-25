import Foundation

struct City: Codable, Identifiable {
  var id: String
  var location: LocationStruct
  var weather: CurrentStruct?

  init(city: RealtimeWeatherStruct) {
    self.id = "\(city.location.lat)\(city.location.lon)"
    self.location = city.location
    self.weather = city.current
  }

}

class Cities: ObservableObject {
  @Published var usersCities: [City] = [] {
    didSet {
      saveCitiesToUserDefaults()
    }
  }

  private func getCitiesFromUserDefaults() -> [City] {
    let data = (UserDefaults.standard.array(forKey: UserDefaultsKeys.usersCities.rawValue) ?? []) as? [City]

    return data ?? []
  }

  init() {
    usersCities = getCitiesFromUserDefaults()
  }

  private func saveCitiesToUserDefaults() {
    UserDefaults.standard.setValue(usersCities, forKeyPath: UserDefaultsKeys.usersCities.rawValue)
  }

  func addUsersCity(city newCity: RealtimeWeatherStruct) {
    let city = City(city: newCity)
    let newCities = usersCities + [city]
    usersCities = newCities
  }
}
