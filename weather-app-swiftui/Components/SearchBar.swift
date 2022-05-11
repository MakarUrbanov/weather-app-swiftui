import Foundation
import SwiftUI

struct SearchBar: View {
  @Binding var text: String
  let placeholder: String

  @State private var isEditing = false

  func showKeyboard() {
    self.isEditing = true
  }

  func hideKeyboard() {
    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    self.isEditing = false
    self.text = ""
  }

  var body: some View {
    HStack {
      Image(systemName: "magnifyingglass")
      .foregroundColor(.gray)
      .frame(alignment: .center)
      .padding(.leading, 14)

      ZStack(alignment: .leading) {
        if text.isEmpty {
          Text(placeholder)
          .font(.system(size: 16))
          .foregroundColor(Color.primary)
          .opacity(0.6)
        }
        TextField("", text: $text)
      }
      .onTapGesture {
        withAnimation {
          showKeyboard()
        }
      }
      .padding(7)
      .padding(.leading, 12)
      .padding(.trailing, 20)
      .background(Color.invertedPrimary)
      .foregroundColor(Color.primary)
      .cornerRadius(8)
      .padding(.horizontal, 10)
      .onSubmit {
        withAnimation {
          hideKeyboard()
        }
      }
      .animation(.easeInOut, value: isEditing)
      .overlay(
        HStack {
          Spacer()

          Button(action: {
            if isEditing {
              text.removeAll()
            }
          }) {
            Image(systemName: "multiply.circle.fill")
            .foregroundColor(.gray)
            .padding(.trailing, 14)
            .opacity(isEditing ? 1 : 0)
          }
        }
        .animation(.easeInOut, value: isEditing)
      )

      if isEditing {
        Button(action: {
          text.removeAll()
          withAnimation {
            hideKeyboard()
          }
        }) {
          Text("Cancel")
        }
        .padding(.trailing, 10)
        .transition(.move(edge: .trailing))
        .opacity(isEditing ? 1 : 0)
        .animation(.easeInOut, value: isEditing)
      }
    }
  }
}
