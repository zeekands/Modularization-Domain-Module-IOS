import Foundation

@MainActor
public protocol MovieRepositoryProtocol {
  func getPopularMovies(page: Int) async throws -> [MovieEntity]
  func getTrendingMovies(page: Int) async throws -> [MovieEntity]
  func getMovieDetails(id: Int) async throws -> MovieEntity?
  func searchMovies(query: String, page: Int) async throws -> [MovieEntity]
  
  // Offline-first & Favorites
  func addOrUpdateMovie(_ movie: MovieEntity) async throws
  func getLocalMovie(id: Int) async throws -> MovieEntity?
  func getFavoriteMovies() async throws -> [MovieEntity]
  func deleteMovie(id: Int) async throws
  
  func updateMovie(_ movie: MovieEntity) async throws
}
