import Foundation
import Combine

class DebouncedState<Value>: ObservableObject {
  @Published var currentValue: Value
  @Published var debouncedValue: Value

  init(initialValue: Value, delay: Int) {
    _currentValue = Published(initialValue: initialValue)
    _debouncedValue = Published(initialValue: initialValue)
    $currentValue
    .debounce(for: .milliseconds(delay), scheduler: RunLoop.main)
    .assign(to: &$debouncedValue)
  }
}
