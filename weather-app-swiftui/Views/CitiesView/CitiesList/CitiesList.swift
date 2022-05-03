import Foundation
import SwiftUI

struct CitiesList: View {
  @EnvironmentObject var viewModel: CitiesViewModel

  var body: some View {
    ScrollView {
      ForEach(viewModel.usersCities) { city in
        SwipeableDeleteWrapper(content: {
          CityItem(city: city)
        }, onDelete: {
          viewModel.deleteCity(id: city.id)
        })
      }
    }
  }
}
