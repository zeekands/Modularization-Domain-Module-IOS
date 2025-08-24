import Foundation

public struct GetFavoriteTVShows: GetFavoriteTVShowsUseCaseProtocol, @unchecked Sendable {
  private let repository: TVShowRepositoryProtocol
  
  public init(repository: TVShowRepositoryProtocol) {
    self.repository = repository
  }
  
  public func execute() async throws -> [TVShowEntity] {
    return try await repository.getFavoriteTVShows()
  }
}
