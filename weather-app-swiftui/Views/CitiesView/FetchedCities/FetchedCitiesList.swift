import Foundation
import SwiftUI

struct FetchedCitiesList: View {
  @StateObject var viewModel = FetchedCitiesListViewModel()
  @EnvironmentObject var citiesViewModel: CitiesViewModel
  @Binding var searchText: String

  var body: some View {
    VStack {
      ScrollView {
        ForEach(viewModel.cities) { city in
          Button(action: {
            citiesViewModel.addFetchedCity(cityName: city.name)
//            UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
          }, label: {
            FetchedCityItem(city: city)
          })
        }
      }

      Spacer()
    }
    .frame(maxWidth: .infinity, maxHeight: .infinity)
    .background(Color.primary)
    .overlay {
      if searchText.count < 3 {
        Text("Enter the city name.\nMinimum number of characters 3")
        .font(.title3.weight(.bold))
        .multilineTextAlignment(.center)
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .padding(.top)
      }
    }
    .onChange(of: searchText) { newValue in
      if searchText.isEmpty {
        viewModel.clearFetchedCities()

        return
      }

      fetchCityNames(searchString: searchText) { fetchedCities in
        viewModel.setCities(cities: fetchedCities)
      }
    }
  }
}
