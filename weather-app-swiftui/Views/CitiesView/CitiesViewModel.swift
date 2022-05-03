import Foundation

let MAX_NON_UPDATED_TIME: TimeInterval = 60 * 5 // 5min

class CitiesViewModel: ObservableObject {
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

  func addUsersCity(city newCity: RealtimeWeather) {
    let city = City(city: newCity)
    usersCities += [city]
  }

  func updateCityData(city: City) {
    fetchWeather(city: city.location.name) { [self] weatherStruct in
      if let weatherStruct = weatherStruct {
        let newCity = City(city: weatherStruct)

        if let cityIndex = usersCities.firstIndex(where: { oldCity in oldCity.id == newCity.id }) {
          self.usersCities[cityIndex] = newCity
        }
      }
    }
  }

  func deleteCity(id: String) {
    self.usersCities.removeAll { city in
      city.id == id
    }
  }

  func addFetchedCity(cityName: String) {
    fetchWeather(city: cityName) { [self] realtimeWeather in
      guard let realtimeWeather = realtimeWeather else {
        return print("Error \(self)")
      }

      if self.usersCities.first(where: { city in city.location.name == realtimeWeather.location.name }) == nil {
        addUsersCity(city: realtimeWeather)
      }
    }
  }
}
