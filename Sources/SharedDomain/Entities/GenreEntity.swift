//
//  GenreEntity.swift
//  SharedDomain
//
//  Created by zeekands on 04/07/25.
//


import Foundation

public struct GenreEntity: Identifiable, Equatable, Sendable, Hashable, Decodable {
    public let id: Int // ID dari TMDB API
    public var name: String

    public init(id: Int, name: String) {
        self.id = id
        self.name = name
    }
}
