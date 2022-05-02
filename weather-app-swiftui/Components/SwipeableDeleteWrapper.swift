import Foundation
import SwiftUI

struct SwipeableDeleteWrapper<Content: View>: View {
  var content: Content
  let onDelete: () -> Void

  @State var xOffset: CGFloat = 0
  @State var lastXOffset: CGFloat = 0
  @State var itemWidth: CGFloat = 0

  let MAX_TRASH_WIDTH: CGFloat = 40
  @State var trashWidth: CGFloat = 0
  @State var isTappedDelete = false

  var gestureHandler: some Gesture {
    DragGesture()
    .onChanged { value in
      let xOffset = lastXOffset + value.translation.width
      let limit = -(itemWidth / 3)
      let factor = 1 / (xOffset / limit + 1)
      let newValue = xOffset * (factor >= 1 ? 1 : factor)
      let trashWidth = xOffset / 2 < -MAX_TRASH_WIDTH ? MAX_TRASH_WIDTH : xOffset / 2

      if xOffset < 0 {
        withAnimation(.easeInOut) {
          self.xOffset = newValue
          self.trashWidth = abs(trashWidth)
        }
      }
    }
    .onEnded { (value: DragGesture.Value) in
      if xOffset < -MAX_TRASH_WIDTH {
        let newValue = -(MAX_TRASH_WIDTH * 2)

        withAnimation(.easeInOut) {
          self.lastXOffset = newValue
          self.xOffset = newValue
        }

        return
      }

      withAnimation(.easeInOut) {
        self.lastXOffset = 0
        self.xOffset = 0
        self.trashWidth = 0
      }
    }
  }

  var onDeleteTapGesture: some Gesture {
    DragGesture(minimumDistance: 0, coordinateSpace: .global)
    .onChanged({ _ in
      self.isTappedDelete = true
    })
    .onEnded({ _ in
      self.isTappedDelete = false
      onDelete()
    })
  }

  init(@ViewBuilder content: () -> Content, onDelete: @escaping () -> Void) {
    self.content = content()
    self.onDelete = onDelete
  }

  var body: some View {
    ZStack {
      ZStack {
        content
        .zIndex(2)
      }
      .contentShape(Rectangle())
      .offset(x: xOffset)
      .gesture(gestureHandler)
    }
    .background {
      GeometryReader { geometry in
        ZStack(alignment: .trailing) {
          ZStack(alignment: .center) {
            Image(systemName: "trash")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: trashWidth)
            .opacity(trashWidth / MAX_TRASH_WIDTH)
          }
          .opacity(isTappedDelete ? 0.3 : 1)
          .frame(width: abs(xOffset))

          Rectangle()
          .fill(Color.black.opacity(0.5))
          .onChange(of: trashWidth) { newValue in
            let itemWidth = geometry.size.width

            if self.itemWidth != itemWidth {
              self.itemWidth = itemWidth
            }
          }
        }
        .gesture(onDeleteTapGesture)
      }
    }
  }
}
