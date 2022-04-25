import Foundation
import SwiftUI

struct CityItem: View {
  var city: City

  func getFormattedTime() -> String {
    let date = Date(timeIntervalSince1970: TimeInterval(city.location.localtimeEpoch))
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "HH:mm"
    return dateFormatter.string(from: date)
  }

  func getTemperature() -> String {
    if let tempC = city.weather?.tempC {
      let tempCInt = Int(floor(tempC))
      return String(tempCInt)
    }

    return "Error"
  }

  func getTemperatureFeelsLike() -> String {
    if let feelslikeC = city.weather?.feelslikeC {
      let feelslikeCInt = Int(floor(feelslikeC))
      return String(feelslikeCInt)
    }

    return "Error"
  }

  var body: some View {
    HStack {
      VStack(alignment: .leading) {
        Text(city.location.name)
        .fontWeight(.bold)

        Text(getFormattedTime())
        .fontWeight(.semibold)
        .opacity(0.7)

        Text(city.weather?.condition.text ?? "")
        .fontWeight(.semibold)
        .padding(.top)
        .opacity(0.7)
      }

      Spacer()

      VStack(alignment: .trailing) {
        Text(getTemperature())
        .font(.system(size: 30, weight: .bold))

        Text("Feels like: \(getTemperatureFeelsLike())")
        .fontWeight(.semibold)
        .padding(.top)
        .opacity(0.7)
      }
    }
    .frame(maxWidth: .infinity)
    .padding()
    .overlay(alignment: .bottom) {
      Divider()
      .background(Color.invertedPrimary)
    }
  }
}
