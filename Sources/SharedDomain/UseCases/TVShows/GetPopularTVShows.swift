import Foundation

public struct GetPopularTVShows: GetPopularTVShowsUseCaseProtocol, @unchecked Sendable {
  private let repository: TVShowRepositoryProtocol
  
  public init(repository: TVShowRepositoryProtocol) {
    self.repository = repository
  }
  
  public func execute(page: Int) async throws -> [TVShowEntity] {
    return try await repository.getPopularTVShows(page: page)
  }
}
