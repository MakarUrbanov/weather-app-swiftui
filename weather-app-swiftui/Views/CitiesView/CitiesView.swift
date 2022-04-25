import Foundation
import SwiftUI

struct CitiesView: View {
  var body: some View {
    VStack {
      Text("Cities")
      .font(.largeTitle.weight(.bold))
      .frame(maxWidth: .infinity, alignment: .leading)
      .padding(.leading)
      .padding(.top)

      CitiesSearchBar()

      CitiesList()

      Spacer()
    }
    .frame(maxWidth: .infinity, maxHeight: .infinity)
  }
}
