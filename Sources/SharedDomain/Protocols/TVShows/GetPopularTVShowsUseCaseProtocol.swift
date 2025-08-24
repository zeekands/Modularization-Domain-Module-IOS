//
//  GetPopularTVShowsUseCaseProtocol.swift
//  SharedDomain
//
//  Created by zeekands on 04/07/25.
//


import Foundation

public protocol GetPopularTVShowsUseCaseProtocol: Sendable { // <-- BARU
    func execute(page: Int) async throws -> [TVShowEntity]
}