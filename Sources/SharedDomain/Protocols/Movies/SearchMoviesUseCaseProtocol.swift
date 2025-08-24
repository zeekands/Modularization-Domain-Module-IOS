//
//  SearchMoviesUseCaseProtocol.swift
//  SharedDomain
//
//  Created by zeekands on 04/07/25.
//


import Foundation

public protocol SearchMoviesUseCaseProtocol: Sendable {
    func execute(query: String, page: Int) async throws -> [MovieEntity]
}