import Foundation
import SwiftUI

struct SelectedCityCurrentWeather: View {
  @EnvironmentObject var viewModel: SelectedCityWeatherViewModel

  var body: some View {
    VStack {
      if let weather = viewModel.selectedCity?.weather {
        AsyncImage(url: URL(string: "https:\(weather.condition.icon)")) { image in
          image
          .resizable()
          .scaledToFit()
          .frame(maxWidth: 80)
          .saturation(0.5)
        } placeholder: {
          ProgressView()
          .scaleEffect(2)
          .frame(maxWidth: 80)
        }
        .frame(maxWidth: 80, maxHeight: 80)

        Text("\(Int(weather.tempC))°")
        .font(.system(size: 80).weight(.bold))

        Text(weather.condition.text)
        .font(.title3.weight(.bold))
        .padding(.bottom, 50)

        HStack(spacing: 100) {

          VStack {
            Text("Wind")
            .fontWeight(.bold)
            .padding(.bottom, 4)

            Text("\(Int(weather.windKph))km/h")
            .font(.body)
          }

          VStack {
            Text("Feels like")
            .fontWeight(.bold)
            .padding(.bottom, 4)

            Text("\(Int(weather.feelslikeC))°")
            .font(.body)
          }
        }
      }
    }
    .frame(maxWidth: .infinity)
  }
}
