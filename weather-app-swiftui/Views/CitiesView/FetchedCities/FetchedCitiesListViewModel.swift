import Foundation

class FetchedCitiesListViewModel: ObservableObject {
  @Published var cities: [FetchedCity] = []

  func deleteFetchedCities() {
    cities = []
  }
}
