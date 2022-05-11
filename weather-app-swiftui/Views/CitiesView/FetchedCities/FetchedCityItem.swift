import Foundation
import SwiftUI

struct FetchedCityItem: View {
  @State var city: FetchedCity

  var body: some View {
    VStack(alignment: .leading) {
      Text(city.name)
      .foregroundColor(Color.invertedPrimary)

      Text(city.country)
      .foregroundColor(Color.invertedPrimary.opacity(0.5))

      Divider()
    }
    .frame(maxWidth: .infinity)
    .padding(.horizontal)
    .padding(.vertical, 8)
  }
}
