import Foundation
import SwiftUI

struct MainWeatherView: View {
  @Binding var currentPage: CurrentPageKeys

  var body: some View {
    VStack {
      Header(name: {
        Text("City")
      }, rightButton: {
        Button(action: {
          currentPage = .cities
        }, label: {
          Image(systemName: "line.3.horizontal")
          .resizable()
          .aspectRatio(contentMode: .fit)
          .frame(maxHeight: 14)
        })
      })
      .foregroundColor(Color.invertedPrimary)

      Spacer()
    }
    .frame(maxWidth: .infinity, maxHeight: .infinity)
  }
}
