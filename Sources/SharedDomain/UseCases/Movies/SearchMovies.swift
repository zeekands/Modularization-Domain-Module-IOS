//
//  SearchMovies.swift
//  SharedDomain
//
//  Created by zeekands on 04/07/25.
//


import Foundation

public struct SearchMovies: SearchMoviesUseCaseProtocol, @unchecked Sendable {
    private let repository: MovieRepositoryProtocol

    public init(repository: MovieRepositoryProtocol) {
        self.repository = repository
    }

    public func execute(query: String, page: Int) async throws -> [MovieEntity] {
        return try await repository.searchMovies(query: query, page: page)
    }
}