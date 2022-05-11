import Foundation
import SwiftUI

struct SelectedCityWeatherView: View {
  @StateObject var viewModel = SelectedCityWeatherViewModel()
  @Binding var currentPage: CurrentPageKeys
  @State var selectedCity: City?

  var body: some View {
    NavigationView {
      VStack(alignment: .center) {
        if let city = viewModel.selectedCity {

          Spacer()

          if city.weather != nil {
            SelectedCityCurrentWeather()
            .offset(y: -70)
          }

          Spacer()

          if viewModel.forecast?.forecast.forecastday != nil {
            SelectedCityForecast()
          }
        } else {
          Text("Select your city")
          .fontWeight(.bold)
        }
      }
      .frame(maxWidth: .infinity, maxHeight: .infinity)
      .padding(20)
      .foregroundColor(Color.invertedPrimary)
      .font(.headline.weight(.semibold))
      .background(Color.primary)
      .navigationBarTitle(viewModel.getCorrectCityName(), displayMode: .inline)
      .navigationBarItems(trailing: Button(action: {
        currentPage = .cities
      }, label: {
        Image(systemName: "line.3.horizontal")
        .resizable()
        .aspectRatio(contentMode: .fit)
        .frame(maxHeight: 14)
        .foregroundColor(Color.invertedPrimary)
      }))
    }
    .onAppear {
      if let selectedCity = selectedCity {
        viewModel.setSelectedCity(city: selectedCity)
      }

      if viewModel.selectedCity != nil {
        viewModel.fetchSelectedCityForecast()
      }
    }
    .navigationViewStyle(.stack)
    .environmentObject(viewModel)
  }
}
