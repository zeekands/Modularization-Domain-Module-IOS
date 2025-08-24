import Foundation

public protocol TVShowRepositoryProtocol {
  func getPopularTVShows(page: Int) async throws -> [TVShowEntity]
  func getTrendingTVShows(page: Int) async throws -> [TVShowEntity]
  func getTVShowDetails(id: Int) async throws -> TVShowEntity?
  func searchTVShows(query: String, page: Int) async throws -> [TVShowEntity]
  
  // Offline-first & Favorites
  func addOrUpdateTVShow(_ tvShow: TVShowEntity) async throws
  func getLocalTVShow(id: Int) async throws -> TVShowEntity?
  func getFavoriteTVShows() async throws -> [TVShowEntity]
  func deleteTVShow(id: Int) async throws
  func updateTVShow(_ tvShow: TVShowEntity) async throws
}
