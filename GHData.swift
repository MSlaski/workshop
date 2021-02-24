import Foundation

struct GHData: Decodable {
  let totalCount: Int
  let items: [Repo]
}

struct Repo: Decodable {
  let name: String
  let private: Bool
  let owner: Owner
  let description: String
  let createdAt: String
  let lastUpdate: String

  let language: String? //At some cases 'language' can be a nill, to avoid runtime errors that property must be optional
}

struct Owner: Decodable {
  let login: String
  let avatarUrl: URL
  let reposUrl: URL
}
