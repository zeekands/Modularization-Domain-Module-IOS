//
//  GenreRepositoryProtocol.swift
//  SharedDomain
//
//  Created by zeekands on 04/07/25.
//


import Foundation

public protocol GenreRepositoryProtocol {
    func getMovieGenres() async throws -> [GenreEntity]
    func getTVShowGenres() async throws -> [GenreEntity]
    // Opsional: add/update genre lokal jika caching
    func getLocalGenres() async throws -> [GenreEntity] // Ambil genre dari cache lokal
    func addOrUpdateGenre(_ genre: GenreEntity) async throws
}
