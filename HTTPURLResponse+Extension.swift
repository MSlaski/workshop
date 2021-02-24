import Foundation

extension HTTPURLResponse {
  func isResponseOK() -> Bool {
    return (200...299).contains(self.statusCode)
  }
}
