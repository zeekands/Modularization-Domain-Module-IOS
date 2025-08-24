//
//  GetFavoriteTVShowsUseCaseProtocol.swift
//  SharedDomain
//
//  Created by zeekands on 04/07/25.
//


import Foundation

public protocol GetFavoriteTVShowsUseCaseProtocol: Sendable {
    func execute() async throws -> [TVShowEntity]
}
