import Foundation
import SwiftUI

struct CitiesList: View {
  @EnvironmentObject var Cities: CitiesModel

  var body: some View {
    ForEach(Cities.usersCities) { city in
      SwipeableDeleteWrapper(content: {
        CityItem(city: city)
      }, onDelete: {
      })
    }
  }
}
