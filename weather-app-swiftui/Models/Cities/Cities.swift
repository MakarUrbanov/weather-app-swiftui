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

class CitiesModel: ObservableObject {
  @Published var usersCities: [City] = [] {
    willSet {
      saveCitiesToUserDefaults(newValue)
    }
  }

  private func getCitiesFromUserDefaults() -> [City] {
    guard let data = UserDefaults.standard.array(forKey: UserDefaultsKeys.usersCities.rawValue) as? [Data] else {
      return []
    }

    let encodedData = data.map {
      try? JSONDecoder().decode(City.self, from: $0)
    }
    .compactMap {
      $0
    }

    return encodedData
  }

  init() {
    usersCities = getCitiesFromUserDefaults()
  }

  private func saveCitiesToUserDefaults(_ cities: [City]) {
    let encodedCitiesArray = cities.map {
      try? JSONEncoder().encode($0)
    }
    UserDefaults.standard.set(encodedCitiesArray, forKey: UserDefaultsKeys.usersCities.rawValue)
  }

  func addUsersCity(city newCity: RealtimeWeatherStruct) {
    let city = City(city: newCity)
    let newCities = usersCities + [city]
    usersCities = newCities
  }
}
