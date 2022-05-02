import Foundation
import SwiftUI

struct CitiesView: View {
  @Binding var currentPage: CurrentPageKeys
  @State var text = ""

  var body: some View {
    NavigationView {
      VStack {
        CitiesList()

        Spacer()
      }
      .navigationBarTitle(Text("Cities"), displayMode: .inline)
      .navigationBarItems(trailing: Button("Back", action: { currentPage = .mainPage }))
      .searchable(text: $text, prompt: "Look for something")
      .frame(maxWidth: .infinity, maxHeight: .infinity)
      .background(Color.primary)
    }
    .navigationViewStyle(.stack)
  }
}
