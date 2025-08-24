import Foundation

public struct GetFavoriteMovies: GetFavoriteMoviesUseCaseProtocol, @unchecked Sendable {
  private let repository: MovieRepositoryProtocol
  
  public init(repository: MovieRepositoryProtocol) {
    self.repository = repository
  }
  
  public func execute() async throws -> [MovieEntity] {
    return try await repository.getFavoriteMovies()
  }
}
