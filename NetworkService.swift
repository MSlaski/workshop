import Foundation

class NetworkService {
  private(set) var remainingRequests: Int!
  
  func request<T: Decodable>(router: Router, completion: @escaping(Result<T, Error>) -> Void) {
    var components = URLComponents()
    components.scheme = router.scheme
    components.host = router.host
    components.path = router.path
    components.queryItems = router.parameters
    
    guard let url = components.url else { return }
    var urlRequest = URLRequest(url: url)
    urlRequest.httpMethod = router.method
    
    let urlSession = URLSession(configuration: .default)
    let dataTask = urlSession.dataTask(with: urlRequest) { (data, response, error) in
      if let error = error {
        debugPrint(error.localizedDescription)
        completion(.failure(error))
      }
      
      guard let httpResponse = response as? HTTPURLResponse else { return }
      if !httpResponse.isResponseOK() {
        debugPrint("Status code different than OK: \(httpResponse.statusCode)")
        return
      }
      
      self.remainingRequests = self.checkRequestsLimit(for: httpResponse)
      guard let data = data else { return }
      do {
        let responseObject = try JSONDecoder().decode(T.self, from: data)
        DispatchQueue.main.async {
          completion(.success(responseObject))
        }
      } catch {
        debugPrint(error.localizedDescription)
        completion(.failure(error))
      }
    }
    dataTask.resume()
  }
  
  private func checkRequestsLimit(for response: HTTPURLResponse) -> Int {
    let remainingRequests = response.allHeaderFields["X-Ratelimit-Remaining"] as? String
    guard let remaining = remainingRequests else { return 0 }
    return remaining.asInt()
  }
  
}
