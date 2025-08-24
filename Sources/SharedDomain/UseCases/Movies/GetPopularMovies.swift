import Foundation

public struct GetPopularMovies: GetPopularMoviesUseCaseProtocol, @unchecked Sendable {
  private let repository: MovieRepositoryProtocol
  
  public init(repository: MovieRepositoryProtocol) {
    self.repository = repository
  }
  
  public func execute(page: Int) async throws -> [MovieEntity] {
    return try await repository.getPopularMovies(page: page)
  }
}
