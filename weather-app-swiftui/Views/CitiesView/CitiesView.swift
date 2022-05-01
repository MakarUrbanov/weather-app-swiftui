import Foundation
import SwiftUI

struct CitiesView: View {
  @Binding var currentPage: CurrentPageKeys

  var body: some View {
    VStack {
      Header(name: { Text("Cities") }, rightButton: { Button("Back", action: { currentPage = .mainPage }) })

      CitiesSearchBar()

      CitiesList()

      Spacer()
    }
    .frame(maxWidth: .infinity, maxHeight: .infinity)
  }
}
