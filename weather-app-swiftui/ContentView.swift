import SwiftUI

struct ContentView: View {
  var body: some View {
    TabView {
      MainWeatherView()
      CitiesView()
    }
    .frame(maxWidth: .infinity, maxHeight: .infinity)
    .background(Color.primary)
    .tabViewStyle(.page)
    .edgesIgnoringSafeArea(.all)
  }
}
