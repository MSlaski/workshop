import Foundation

extension String {
  func asInt() -> Int {
    return Int(self) ?? 0
  }
}
