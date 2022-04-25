import Foundation
import SwiftUI

struct CitiesView: View {
  var body: some View {
    VStack {
      CitiesSearchBar()
      Spacer()
    }
    .frame(maxWidth: .infinity, maxHeight: .infinity)
  }
}
