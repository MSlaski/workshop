import Foundation

extension String {
  func getIntValue() -> Int {
    return Int(self) ?? 0
  }
}
