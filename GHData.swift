import Foundation

struct GHData: Decodable {
  let total_Count: Int
  let items: [Repo]
}

struct Repo: Decodable {
  let name: String
  let private: Bool
  let owner: Owner
  let description: String
  let created_at: String
  let last_update: String
  let language: String? //At some cases 'language' can be a nill, to avoid runtime errors that property must be optional
}

struct Owner: Decodable {
  let login: String
  let avatar_url: URL
  let repos_url: URL
}
