//
//  GetMovieDetail.swift
//  SharedDomain
//
//  Created by zeekands on 04/07/25.
//


import Foundation

public struct GetMovieDetail: GetMovieDetailUseCaseProtocol, @unchecked Sendable {
    private let repository: MovieRepositoryProtocol

    public init(repository: MovieRepositoryProtocol) {
        self.repository = repository
    }

    public func execute(id: Int) async throws -> MovieEntity? {
        return try await repository.getMovieDetails(id: id)
    }
}