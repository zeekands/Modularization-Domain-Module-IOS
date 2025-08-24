//
//  SearchTVShows.swift
//  SharedDomain
//
//  Created by zeekands on 04/07/25.
//


import Foundation

public struct SearchTVShows: SearchTVShowsUseCaseProtocol, @unchecked Sendable {
    private let repository: TVShowRepositoryProtocol

    public init(repository: TVShowRepositoryProtocol) {
        self.repository = repository
    }

    public func execute(query: String, page: Int) async throws -> [TVShowEntity] {
        return try await repository.searchTVShows(query: query, page: page)
    }
}