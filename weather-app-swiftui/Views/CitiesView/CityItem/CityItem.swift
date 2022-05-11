import Foundation
import SwiftUI

struct CityItem: View {
  @EnvironmentObject var citiesViewModel: CitiesViewModel
  @ObservedObject var viewModel: CityItemViewModel

  init(city: City) {
    self.viewModel = CityItemViewModel(city: city)
  }

  var body: some View {
    VStack {
      HStack {
        VStack(alignment: .leading) {
          Text(viewModel.city.location.name)
          .fontWeight(.bold)

          Text(viewModel.getFormattedTime())
          .fontWeight(.semibold)
          .opacity(0.7)
        }

        Spacer()

        HStack {
          Text(viewModel.getTemperature())
          .font(.system(size: 60, weight: .bold))
          .padding(.trailing, -10)

          AsyncImage(url: URL(string: "https:\(viewModel.city.weather?.condition.icon ?? "")")) { image in
            image
            .resizable()
            .scaledToFit()
            .frame(width: 25, height: 25)
            .offset(y: -15)
            .saturation(0.5)
          } placeholder: {
            ProgressView()
            .offset(y: -15)
            .frame(width: 25, height: 25)
          }
        }
        .frame(height: 60)
      }

      HStack {
        Text(viewModel.city.weather?.condition.text ?? "")
        .fontWeight(.semibold)
        .padding(.top)
        .opacity(0.7)

        Spacer()

        Text("Feels like: \(viewModel.getTemperatureFeelsLike())")
        .fontWeight(.semibold)
        .padding(.top)
        .opacity(0.7)
      }
    }
    .foregroundColor(Color.invertedPrimary)
    .frame(maxWidth: .infinity)
    .padding()
    .background(Color.primary)
    .overlay(alignment: .bottom) {
      Divider()
      .background(Color.invertedPrimary)
    }
    .onAppear {
      if viewModel.isNeedUpdate {
        citiesViewModel.updateCityData(city: viewModel.city)
      }
    }
  }
}
