import Foundation
import SwiftUI

struct PressableWrapper<Content>: View where Content: View {
  var content: Content
  var activeOpacity: Double
  @State var isTapped = false

  init(activeOpacity: Double = 0.8, @ViewBuilder content: () -> Content) {
    self.content = content()
    self.activeOpacity = activeOpacity
  }

  var body: some View {
    let onTapGestureHandler = DragGesture(minimumDistance: 0, coordinateSpace: .global)
    .onChanged({ _ in
      isTapped = true
    })
    .onEnded({ _ in
      isTapped = false
    })

    content
    .contentShape(Rectangle())
    .gesture(onTapGestureHandler)
    .opacity(isTapped ? activeOpacity : 1)
  }
}
