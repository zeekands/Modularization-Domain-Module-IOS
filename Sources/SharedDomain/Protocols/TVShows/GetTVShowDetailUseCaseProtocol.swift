//
//  GetTVShowDetailUseCaseProtocol.swift
//  SharedDomain
//
//  Created by zeekands on 04/07/25.
//


import Foundation

public protocol GetTVShowDetailUseCaseProtocol: Sendable {
    func execute(id: Int) async throws -> TVShowEntity?
}