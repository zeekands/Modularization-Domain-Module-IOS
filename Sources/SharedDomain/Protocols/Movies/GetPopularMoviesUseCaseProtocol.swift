//
//  GetPopularMoviesUseCaseProtocol.swift
//  SharedDomain
//
//  Created by zeekands on 04/07/25.
//


import Foundation

public protocol GetPopularMoviesUseCaseProtocol: Sendable {
    func execute(page: Int) async throws -> [MovieEntity]
}