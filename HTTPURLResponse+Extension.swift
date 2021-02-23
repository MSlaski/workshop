import Foundation

extension HTTPURLResponse {
  func isResponseOK() -> Bool {
    return (200...201).contains(self.statusCode)
  }
}
