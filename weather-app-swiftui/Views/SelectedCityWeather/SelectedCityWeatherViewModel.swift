import Foundation

class SelectedCityWeatherViewModel: ObservableObject {
  @Published var selectedCity: City? {
    willSet {
      UserDefaultsManager.setData(data: newValue, key: .selectedCity)
    }
  }
  @Published var forecast: Forecast? {
    willSet {
      UserDefaultsManager.setData(data: newValue, key: .forecastSelectedCity)
    }
  }

  init() {
    self.selectedCity = UserDefaultsManager.getData(key: .selectedCity, dataType: City.self)
    self.forecast = UserDefaultsManager.getData(key: .forecastSelectedCity, dataType: Forecast.self)
  }

  func setSelectedCity(city: City) {
    self.selectedCity = city
  }

  func getCorrectCityName() -> String {
    if let cityName = selectedCity {
      return "\(cityName.location.name), \(cityName.location.country)"
    }

    return "City"
  }

  func fetchSelectedCityForecast() {
    if let cityName = selectedCity?.location.name {
      fetchForecast(city: cityName) { forecast in
        if let forecast = forecast {
          self.forecast = forecast
        }
      }
    }
  }
}
