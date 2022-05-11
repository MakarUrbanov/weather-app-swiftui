import Foundation
import SwiftUI

struct Header<Content: View>: View {
  var name: Text
  var rightButton: Content?

  init(name: () -> Text, @ViewBuilder rightButton: () -> Content? = {
    nil
  }) {
    self.name = name()
    self.rightButton = rightButton()
  }

  var body: some View {
    HStack(alignment: .center) {
      name
      .font(.largeTitle.weight(.bold))
      .frame(maxWidth: .infinity, alignment: .leading)

      Spacer()

      rightButton
    }
    .padding(.top)
    .padding(.horizontal)
  }
}
