import SwiftUI

struct ContentView: View {
  @StateObject var Cities = CitiesModel()

  var body: some View {
    TabView {
      MainWeatherView()
      CitiesView()
    }
    .frame(maxWidth: .infinity, maxHeight: .infinity)
    .background(Color.primary)
    .tabViewStyle(.page)
    .edgesIgnoringSafeArea(.all)
    .environmentObject(Cities)
  }
}
