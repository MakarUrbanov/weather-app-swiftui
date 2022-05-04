import Foundation
import SwiftUI

struct CitiesView: View {
  @StateObject var viewModel: CitiesViewModel = CitiesViewModel()

  @Binding var currentPage: CurrentPageKeys
  @Binding var selectedCity: City?

  @StateObject var searchText = DebouncedState(initialValue: "", delay: 300)

  var body: some View {
    NavigationView {
      ZStack {

        VStack {
          CitiesList(selectedCity: $selectedCity, currentPage: $currentPage)

          Spacer()
        }

        if !searchText.currentValue.isEmpty {
          FetchedCitiesList(searchText: $searchText.debouncedValue)
        }

      }
      .navigationBarTitle(Text("Cities"), displayMode: .inline)
      .searchable(text: $searchText.currentValue, prompt: "Enter city")
      .frame(maxWidth: .infinity, maxHeight: .infinity)
      .background(Color.primary)
      .onChange(of: viewModel.usersCities.count, perform: { _ in
        searchText.currentValue.removeAll()
      })
    }
    .navigationViewStyle(.stack)
    .environmentObject(viewModel)
  }
}
