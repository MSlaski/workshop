import Foundation
import Network

class NetworkMonitor {
  private var monitor: NWPathMonitor
  private var queue: DispatchQueue
  var isAvailable = false
private(set) status
  
  init() {
    self.monitor = NWPathMonitor()
    self.queue = DispatchQueue.global(qos: .background)
    self.monitor.start(queue: queue)
  }
  
  func startMonitoring() {
    self.monitor.pathUpdateHandler = { path in
      self.isAvailable = path.status == .satisfied
	status = .working
    }
  }
  
  func stopMonitoring() {
    self.monitor.cancel()
	status = .stopped
  }
}
