//
//  GetTrendingTVShowsUseCaseProtocol.swift
//  SharedDomain
//
//  Created by zeekands on 04/07/25.
//


import Foundation

public protocol GetTrendingTVShowsUseCaseProtocol: Sendable {
    func execute(page: Int) async throws -> [TVShowEntity]
}