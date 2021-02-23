import Foundation

struct GHData: Decodable {
  let totalCount: Int
  let items: [Repo]
  
  private enum CodingKeys: String, CodingKey {
    case totalCount = "total_count"
    case items = "items"
  }
}

struct Repo: Decodable {
  let name: String
  let isPrivate: Bool
  let owner: Owner
  let description: String
  let createdAt: String
  let lastUpdate: String
  let language: String? //At some cases 'language' can be a nill, to avoid runtime errors that property must be optional
  
  private enum CodingKeys: String, CodingKey {
    case name
    case isPrivate = "private"
    case owner
    case description
    case createdAt = "created_at"
    case lastUpdate = "updated_at"
    case language
  }
}

struct Owner: Decodable {
  let login: String
  let avatar: URL
  let allRepositories: URL
  
  private enum CodingKeys: String, CodingKey {
    case login
    case avatar = "avatar_url"
    case allRepositories = "repos_url"
  }
}
