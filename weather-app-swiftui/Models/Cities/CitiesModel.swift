import Foundation

let MAX_NON_UPDATED_TIME: TimeInterval = 60 * 5 // 5min

class CitiesModel: ObservableObject {
  @Published var usersCities: [CityModel] = [] {
    willSet {
      saveCitiesToUserDefaults(newValue)
    }
  }

  private func getCitiesFromUserDefaults() -> [CityModel] {
    guard let data = UserDefaults.standard.array(forKey: UserDefaultsKeys.usersCities.rawValue) as? [Data] else {
      return []
    }

    let encodedData = data.map {
      try? JSONDecoder().decode(CityModel.self, from: $0)
    }
    .compactMap {
      $0
    }

    return encodedData
  }

  init() {
    usersCities = getCitiesFromUserDefaults()
  }

  private func saveCitiesToUserDefaults(_ cities: [CityModel]) {
    let encodedCitiesArray = cities.map {
      try? JSONEncoder().encode($0)
    }
    UserDefaults.standard.set(encodedCitiesArray, forKey: UserDefaultsKeys.usersCities.rawValue)
  }

  func addUsersCity(city newCity: RealtimeWeatherStruct) {
    let city = CityModel(city: newCity)
    let newCities = usersCities + [city]
    usersCities = newCities
  }

  func updateCityData(city: CityModel) {
    let newCities = usersCities.map { oldCity -> CityModel in
      if oldCity.id == oldCity.id {
        return city
      }

      return oldCity
    }

    usersCities = newCities
  }
}
