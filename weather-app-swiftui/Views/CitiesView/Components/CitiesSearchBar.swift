import Foundation
import SwiftUI

struct CitiesSearchBar: View {
  @State var inputValue = ""

  var body: some View {
    VStack {
      SearchBar(text: $inputValue, placeholder: "Enter city")
    }
  }
}
