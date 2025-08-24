//
//  ToggleFavoriteUseCaseProtocol.swift
//  SharedDomain
//
//  Created by zeekands on 04/07/25.
//


import Foundation

public protocol ToggleFavoriteUseCaseProtocol: Sendable {
    // Metode ini bisa di-overload atau menerima tipe generik jika Anda mau
    func execute(movieId: Int, isFavorite: Bool) async throws
    func execute(tvShowId: Int, isFavorite: Bool) async throws // <-- BARU
}