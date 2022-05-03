import Foundation
import SwiftUI

struct CitiesView: View {
  @StateObject var viewModel: CitiesViewModel = CitiesViewModel()

  @Binding var currentPage: CurrentPageKeys
  @State var searchText = ""
  @State var isSearch: Bool = false

  var body: some View {
    NavigationView {
      VStack {
        CitiesList()
        .overlay {
          if isSearch {
            FetchedCitiesList()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.primary)
          }
        }

        Spacer()
      }
      .navigationBarTitle(Text("Cities"), displayMode: .inline)
      .navigationBarItems(trailing: Button("Back", action: { currentPage = .mainPage }))
      .searchable(text: $searchText, prompt: "Enter city")
      .onChange(of: searchText) { newValue in
        if newValue.isEmpty {
          isSearch = false
        } else {
          isSearch = true
        }
      }
      .frame(maxWidth: .infinity, maxHeight: .infinity)
      .background(Color.primary)
    }
    .navigationViewStyle(.stack)
    .environmentObject(viewModel)
  }
}
