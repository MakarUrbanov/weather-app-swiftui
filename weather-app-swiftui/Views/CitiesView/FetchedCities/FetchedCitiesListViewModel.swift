import Foundation

class FetchedCitiesListViewModel: ObservableObject {
  @Published var cities: [FetchedCity] = []

  func clearFetchedCities() {
    cities = []
  }

  func setCities(cities: [FetchedCity]?) {
    guard let correctCities = cities else {
      return print("ERROR FetchedCitiesListViewModel")
    }

    self.cities = correctCities
  }
}
