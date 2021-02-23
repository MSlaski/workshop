import Foundation
import Network

class NetworkMonitor {
  static let shared = NetworkMonitor()
  private var monitor: NWPathMonitor
  private var queue: DispatchQueue
  var isAvailable = false
  
  private init() {
    self.monitor = NWPathMonitor()
    self.queue = DispatchQueue.global(qos: .background)
    self.monitor.start(queue: queue)
  }
  
  func startMonitoring() {
    self.monitor.pathUpdateHandler = { path in
      self.isAvailable = path.status == .satisfied
    }
  }
  
  func stopMonitoring() {
    self.monitor.cancel()
  }
}
