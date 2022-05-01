import SwiftUI

enum CurrentPageKeys: String {
  case mainPage
  case cities
}

struct ContentView: View {
  @StateObject var Cities = CitiesModel()
  @State var currentPage: CurrentPageKeys = .mainPage

  var body: some View {
    VStack {
      switch currentPage {
      case .mainPage:
        MainWeatherView(currentPage: $currentPage)

      case .cities:
        CitiesView(currentPage: $currentPage)
      }
    }
    .frame(maxWidth: .infinity, maxHeight: .infinity)
    .background(Color.primary)
    .edgesIgnoringSafeArea(.horizontal)
    .edgesIgnoringSafeArea(.bottom)
    .environmentObject(Cities)
  }
}
