import Foundation
import SwiftUI

struct CitiesList: View {
  @EnvironmentObject var viewModel: CitiesViewModel

  var body: some View {
    ForEach(viewModel.usersCities) { city in
      SwipeableDeleteWrapper(content: {
        CityItem(city: city)
      }, onDelete: {
      })
    }
  }
}
