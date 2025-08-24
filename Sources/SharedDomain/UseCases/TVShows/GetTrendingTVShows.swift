//
//  GetTrendingTVShows.swift
//  SharedDomain
//
//  Created by zeekands on 04/07/25.
//


import Foundation

public struct GetTrendingTVShows: GetTrendingTVShowsUseCaseProtocol, @unchecked Sendable {
    private let repository: TVShowRepositoryProtocol

    public init(repository: TVShowRepositoryProtocol) {
        self.repository = repository
    }

    public func execute(page: Int) async throws -> [TVShowEntity] {
        return try await repository.getTrendingTVShows(page: page)
    }
}