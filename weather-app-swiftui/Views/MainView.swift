import SwiftUI

enum CurrentPageKeys: String {
  case mainPage
  case cities
}

struct MainView: View {
  @State var currentPage: CurrentPageKeys = .mainPage
  @State var selectedCity: City?

  var body: some View {
    VStack {
      switch currentPage {
      case .mainPage:
        MainWeatherView(currentPage: $currentPage, selectedCity: $selectedCity)

      case .cities:
        CitiesView(currentPage: $currentPage, selectedCity: $selectedCity)
      }
    }
    .frame(maxWidth: .infinity, maxHeight: .infinity)
    .background(Color.primary)
    .edgesIgnoringSafeArea(.horizontal)
    .edgesIgnoringSafeArea(.bottom)
  }
}
