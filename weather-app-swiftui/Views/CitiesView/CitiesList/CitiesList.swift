import Foundation
import SwiftUI

struct CitiesList: View {
  @EnvironmentObject var viewModel: CitiesViewModel

  @Binding var selectedCity: City?
  @Binding var currentPage: CurrentPageKeys

  var body: some View {
    ScrollView {
      ForEach(viewModel.usersCities) { city in
        SwipeableDeleteWrapper(content: {

          PressableWrapper(content: {
            CityItem(city: city)
          }, perform: {
            selectedCity = city
            currentPage = .mainPage
          })

        }, onDelete: {
          viewModel.deleteCity(id: city.id)
        })
      }
    }
  }
}
