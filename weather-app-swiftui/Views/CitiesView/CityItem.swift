import Foundation
import SwiftUI

struct CityItem: View {
  @EnvironmentObject var Cities: CitiesModel
  @ObservedObject var cityItemVM: CityItemVM

  init(city: City) {
    self.cityItemVM = CityItemVM(city: city)
  }

  var body: some View {
    HStack {
      VStack(alignment: .leading) {
        Text(cityItemVM.city.location.name)
        .fontWeight(.bold)

        Text(cityItemVM.getFormattedTime())
        .fontWeight(.semibold)
        .opacity(0.7)

        Text(cityItemVM.city.weather?.condition.text ?? "")
        .fontWeight(.semibold)
        .padding(.top)
        .opacity(0.7)
      }

      Spacer()

      VStack(alignment: .trailing) {
        Text(cityItemVM.getTemperature())
        .font(.system(size: 30, weight: .bold))

        Text("Feels like: \(cityItemVM.getTemperatureFeelsLike())")
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
    .onAppear {
      if cityItemVM.isNeedUpdate {
        cityItemVM.updateCityData { newCityData in
          if let newCityData = newCityData {
            Cities.updateCityData(city: newCityData)
          }
        }
      }
    }
  }
}
