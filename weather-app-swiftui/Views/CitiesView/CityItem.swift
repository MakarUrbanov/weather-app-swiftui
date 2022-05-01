import Foundation
import SwiftUI

struct CityItem: View {
  @EnvironmentObject var Cities: CitiesModel
  @ObservedObject var cityItemVM: CityItemVM

  init(city: City) {
    self.cityItemVM = CityItemVM(city: city)
  }

  var body: some View {
    VStack {
      HStack {
        VStack(alignment: .leading) {
          Text(cityItemVM.city.location.name)
          .fontWeight(.bold)

          Text(cityItemVM.getFormattedTime())
          .fontWeight(.semibold)
          .opacity(0.7)
        }

        Spacer()

        HStack {
          Text(cityItemVM.getTemperature())
          .font(.system(size: 60, weight: .bold))
          .padding(.trailing, -10)

          AsyncImage(url: URL(string: "https:\(cityItemVM.city.weather?.condition.icon ?? "")")) { image in
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
        Text(cityItemVM.city.weather?.condition.text ?? "")
        .fontWeight(.semibold)
        .padding(.top)
        .opacity(0.7)

        Spacer()

        Text("Feels like: \(cityItemVM.getTemperatureFeelsLike())")
        .fontWeight(.semibold)
        .padding(.top)
        .opacity(0.7)
      }
    }
    .frame(maxWidth: .infinity)
    .padding()
    .background(Color.primary)
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
