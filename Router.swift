import Foundation

enum Router {
  case getRepos(query: String, page: Int)
  case getAllUserRepos(name: String)
  
  var scheme: String {
    return "https"
  }
  
  var host: String {
    return "api.github.com"
  }
  
  var path: String {
    switch self {
    case .getRepos:
      return "/search/repositories"
    case .getAllUserRepos(let name):
      return "/users/\(name)/repos"
    }
  }
  
  var parameters: [URLQueryItem] {
    switch self {
    case .getRepos(let query, let page):
      return [
        URLQueryItem(name: "q", value: query),
        URLQueryItem(name: "order", value: "asc"),
        URLQueryItem(name: "sort", value: "stars"),
        URLQueryItem(name: "page", value: "\(page)")
      ]
    case .getAllUserRepos:
      return [
        URLQueryItem(name: "sort", value: "stars"),
        URLQueryItem(name: "order", value: "asc")
      ]
    }
  }
  
  var method: String {
    return "GET"
  }
}
