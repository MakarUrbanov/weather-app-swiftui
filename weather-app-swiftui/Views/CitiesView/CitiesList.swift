import Foundation
import SwiftUI

struct CitiesList: View {
  @EnvironmentObject var Cities: CitiesModel

  var body: some View {
    VStack {
      ForEach(Cities.usersCities) { city in
        PressableWrapper {
          CityItem(city: city)
        }
      }
    }
  }
}
