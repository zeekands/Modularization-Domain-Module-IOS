//
//  TVShowEntity.swift
//  SharedDomain
//
//  Created by zeekands on 04/07/25.
//


import Foundation

public struct TVShowEntity: Identifiable, Equatable, Sendable, Hashable {
    public let id: Int // ID dari TMDB API
    public var name: String
    public var overview: String?
    public var posterPath: String?
    public var backdropPath: String?
    public var firstAirDate: Date?
    public var voteAverage: Double?
    public var isFavorite: Bool // Fitur Favorite
    public var genres: [GenreEntity] // Relasi ke Genre

    public init(
        id: Int,
        name: String,
        overview: String? = nil,
        posterPath: String? = nil,
        backdropPath: String? = nil,
        firstAirDate: Date? = nil,
        voteAverage: Double? = nil,
        isFavorite: Bool = false,
        genres: [GenreEntity] = []
    ) {
        self.id = id
        self.name = name
        self.overview = overview
        self.posterPath = posterPath
        self.backdropPath = backdropPath
        self.firstAirDate = firstAirDate
        self.voteAverage = voteAverage
        self.isFavorite = isFavorite
        self.genres = genres
    }
}
