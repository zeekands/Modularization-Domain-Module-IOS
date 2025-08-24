import Foundation

public struct ToggleFavorite: ToggleFavoriteUseCaseProtocol, @unchecked Sendable {
  private let movieRepository: MovieRepositoryProtocol
  private let tvShowRepository: TVShowRepositoryProtocol
  
  public init(movieRepository: MovieRepositoryProtocol, tvShowRepository: TVShowRepositoryProtocol) {
    self.movieRepository = movieRepository
    self.tvShowRepository = tvShowRepository
  }
  
  public func execute(movieId: Int, isFavorite: Bool) async throws {
    if var movie = try await movieRepository.getMovieDetails(id: movieId) {
      movie.isFavorite = isFavorite
      try await movieRepository.updateMovie(movie)
    }
  }
  
  public func execute(tvShowId: Int, isFavorite: Bool) async throws {
    if var tvShow = try await tvShowRepository.getTVShowDetails(id: tvShowId) {
      tvShow.isFavorite = isFavorite
      try await tvShowRepository.updateTVShow(tvShow)
    }
  }
}
