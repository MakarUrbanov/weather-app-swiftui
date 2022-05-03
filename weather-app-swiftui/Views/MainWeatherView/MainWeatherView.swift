import Foundation
import SwiftUI

struct MainWeatherView: View {
  @Binding var currentPage: CurrentPageKeys
  @Binding var selectedCity: City?

  var body: some View {
    NavigationView {
      VStack {
        Text(selectedCity?.location.name ?? "Main page")

        Spacer()
      }
      .navigationBarTitle(Text("City"), displayMode: .inline)
      .navigationBarItems(trailing: Button(action: {
        currentPage = .cities
      }, label: {
        Image(systemName: "line.3.horizontal")
        .resizable()
        .aspectRatio(contentMode: .fit)
        .frame(maxHeight: 14)
      }))
      .frame(maxWidth: .infinity, maxHeight: .infinity)
      .foregroundColor(Color.invertedPrimary)
      .background(Color.primary)
    }
    .navigationViewStyle(.stack)
  }
}
