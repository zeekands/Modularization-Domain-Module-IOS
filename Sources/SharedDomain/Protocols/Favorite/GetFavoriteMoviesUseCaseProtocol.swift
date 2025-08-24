//
//  GetFavoriteMoviesUseCaseProtocol.swift
//  SharedDomain
//
//  Created by zeekands on 04/07/25.
//


import Foundation

public protocol GetFavoriteMoviesUseCaseProtocol: Sendable {
    func execute() async throws -> [MovieEntity]
}