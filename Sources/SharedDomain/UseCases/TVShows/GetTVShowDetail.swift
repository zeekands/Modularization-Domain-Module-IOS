//
//  GetTVShowDetail.swift
//  SharedDomain
//
//  Created by zeekands on 04/07/25.
//


import Foundation

public struct GetTVShowDetail: GetTVShowDetailUseCaseProtocol, @unchecked Sendable {
    private let repository: TVShowRepositoryProtocol

    public init(repository: TVShowRepositoryProtocol) {
        self.repository = repository
    }

    public func execute(id: Int) async throws -> TVShowEntity? {
        return try await repository.getTVShowDetails(id: id)
    }
}