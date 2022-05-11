import Foundation
import SwiftUI

struct SelectedCityForecast: View {
  @EnvironmentObject var viewModel: SelectedCityWeatherViewModel

  func getCorrectDateString(date: String) -> String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "YYYY-MM-DD"
    if let dateObj = dateFormatter.date(from: date) {
      dateFormatter.dateFormat = "EEE, MMM d"

      return dateFormatter.string(from: dateObj)
    }

    return date
  }

  var body: some View {
    VStack {
      if let forecast = viewModel.forecast?.forecast.forecastday {
        ForEach(forecast) { forecast in
          HStack {
            Text(getCorrectDateString(date: forecast.date))
            .multilineTextAlignment(.leading)
            .frame(width: 100, alignment: .leading)

            Spacer()

            AsyncImage(url: URL(string: "https:\(forecast.day.condition.icon)")) { image in
              image
              .resizable()
              .scaledToFit()
              .frame(maxWidth: 30)
              .saturation(0.5)
            } placeholder: {
              ProgressView()
              .frame(maxWidth: 30)
            }
            .frame(maxWidth: 30, maxHeight: 30)

            Spacer()

            Text("\(Int(forecast.day.maxtempC))° \(Int(forecast.day.mintempC))°")
            .frame(width: 80, alignment: .trailing)
          }
        }
      }
    }
    .frame(maxWidth: .infinity)
  }
}
