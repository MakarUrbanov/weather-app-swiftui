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
    let newCities = usersCities + [city]
    usersCities = newCities
  }

  func updateCityData(city: City) {
    let newCities = usersCities.map { oldCity -> City in
      if oldCity.id == oldCity.id {
        return city
      }

      return oldCity
    }

    usersCities = newCities
  }
}
