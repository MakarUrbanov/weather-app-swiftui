import SwiftUI

struct ContentView: View {
  @State var isLoading = true
  @State var weather: RealtimeWeatherStruct?

  var body: some View {
    VStack {
      if isLoading {
        ProgressView()
      } else {
        if let weatherCurrent = weather?.current {
          Text(String(weatherCurrent.tempC))
          Text(String(weatherCurrent.feelslikeC))
        }
      }
    }
    .onAppear {
      fetchWeather(city: "Sankt-Peterburg") { weather in
        self.weather = weather
        isLoading = false
      }
    }
  }
}
