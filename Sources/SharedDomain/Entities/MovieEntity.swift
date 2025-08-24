import Foundation

public struct MovieEntity: Identifiable, Equatable, Sendable, Hashable, Decodable {
  public let id: Int
  public var title: String
  public var overview: String?
  public var posterPath: String?
  public var backdropPath: String?
  public var releaseDate: Date?
  public var voteAverage: Double?
  public var isFavorite: Bool
  public var genres: [GenreEntity]
  
  public init(
    id: Int,
    title: String,
    overview: String? = nil,
    posterPath: String? = nil,
    backdropPath: String? = nil,
    releaseDate: Date? = nil,
    voteAverage: Double? = nil,
    isFavorite: Bool = false,
    genres: [GenreEntity] = []
  ) {
    self.id = id
    self.title = title
    self.overview = overview
    self.posterPath = posterPath
    self.backdropPath = backdropPath
    self.releaseDate = releaseDate
    self.voteAverage = voteAverage
    self.isFavorite = isFavorite
    self.genres = genres
  }
  
  // Custom decoder to handle Int/Double for voteAverage
  public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    id = try container.decode(Int.self, forKey: .id)
    title = try container.decode(String.self, forKey: .title)
    overview = try? container.decode(String.self, forKey: .overview)
    posterPath = try? container.decode(String.self, forKey: .posterPath)
    backdropPath = try? container.decode(String.self, forKey: .backdropPath)
    releaseDate = try? container.decode(Date.self, forKey: .releaseDate)
    
    // Int or Double
    if let doubleValue = try? container.decode(Double.self, forKey: .voteAverage) {
      voteAverage = doubleValue
    } else if let intValue = try? container.decode(Int.self, forKey: .voteAverage) {
      voteAverage = Double(intValue)
    } else {
      voteAverage = nil
    }
    
    isFavorite = (try? container.decode(Bool.self, forKey: .isFavorite)) ?? false
    genres = (try? container.decode([GenreEntity].self, forKey: .genres)) ?? []
  }
  
  private enum CodingKeys: String, CodingKey {
    case id, title, overview, posterPath, backdropPath, releaseDate, voteAverage, isFavorite, genres
  }
}
