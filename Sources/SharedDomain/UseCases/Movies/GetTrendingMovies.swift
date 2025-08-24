//
//  GetTrendingMovies.swift
//  SharedDomain
//
//  Created by zeekands on 04/07/25.
//


import Foundation

public struct GetTrendingMovies: GetTrendingMoviesUseCaseProtocol, @unchecked Sendable {
    private let repository: MovieRepositoryProtocol

    public init(repository: MovieRepositoryProtocol) {
        self.repository = repository
    }

    public func execute(page: Int) async throws -> [MovieEntity] {
        return try await repository.getTrendingMovies(page: page)
    }
}