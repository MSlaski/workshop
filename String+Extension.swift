import Foundation

extension String {
  func intValue() -> Int {
    return Int(self) ?? 0
  }
}
