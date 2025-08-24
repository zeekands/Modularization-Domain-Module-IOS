//
//  MockMovieRepository.swift
//  SharedDomain
//
//  Created by zeekands on 24/08/25.
//


import Foundation
import SharedDomain

final class MockMovieRepository: MovieRepositoryProtocol {
  var getPopularMoviesResult: Result<[MovieEntity], Error>?
  var getTrendingMoviesResult: Result<[MovieEntity], Error>?
  var getMovieDetailsResult: Result<MovieEntity, Error>?
  var searchMoviesResult: Result<[MovieEntity], Error>?
  var getLocalMovieResult: Result<MovieEntity?, Error>?
  var getFavoriteMoviesResult: Result<[MovieEntity], Error>?
  var toggleFavoriteResult: Result<Bool, Error>?
  var deleteMovieResult: Result<Void, Error>?
  var updateMovieResult: Result<Void, Error>?
  var addMovieResult: Result<Void, Error>?
  var getMovieDetails: Result<MovieEntity, Error>?
  var addOrUpdateMovie: Result<Void, Error>?
  
  func getPopularMovies(page: Int) async throws -> [MovieEntity] {
    if let result = getPopularMoviesResult {
      switch result {
        case .success(let movies): return movies
        case .failure(let error): throw error
      }
    }
    return []
  }
  
  func getTrendingMovies(page: Int) async throws -> [MovieEntity] {
    if let result = getTrendingMoviesResult {
      switch result {
        case .success(let movies): return movies
        case .failure(let error): throw error
      }
    }
    return []
  }
  
  func getMovieDetails(id: Int) async throws -> MovieEntity {
    if let result = getMovieDetailsResult {
      switch result {
        case .success(let movie): return movie
        case .failure(let error): throw error
      }
    }
    throw MockError.notImplemented
  }
  
  func searchMovies(query: String, page: Int) async throws -> [MovieEntity] {
    if let result = searchMoviesResult {
      switch result {
        case .success(let movies): return movies
        case .failure(let error): throw error
      }
    }
    return []
  }
  
  func getLocalMovie(id: Int) async throws -> MovieEntity? {
    if let result = getLocalMovieResult {
      switch result {
        case .success(let movie): return movie
        case .failure(let error): throw error
      }
    }
    return nil
  }
  
  func getFavoriteMovies() async throws -> [MovieEntity] {
    if let result = getFavoriteMoviesResult {
      switch result {
        case .success(let movies): return movies
        case .failure(let error): throw error
      }
    }
    return []
  }
  
  func toggleFavoriteStatus(for movieId: Int) async throws -> Bool {
    if let result = toggleFavoriteResult {
      switch result {
        case .success(let isFavorite): return isFavorite
        case .failure(let error): throw error
      }
    }
    throw MockError.notImplemented
  }
  
  func deleteMovie(id: Int) async throws {
    if let result = deleteMovieResult {
      switch result {
        case .success: return
        case .failure(let error): throw error
      }
    }
    throw MockError.notImplemented
  }
  
  func updateMovie(_ movie: MovieEntity) async throws {
    if let result = updateMovieResult {
      switch result {
        case .success: return
        case .failure(let error): throw error
      }
    }
    throw MockError.notImplemented
  }
  
  func getMovieDetails(id: Int) async throws -> SharedDomain.MovieEntity? {
    if let result = getMovieDetailsResult {
      switch result {
        case .success(let movie): return movie
        case .failure(let error): throw error
      }
    }
    return nil
  }

  
  func addOrUpdateMovie(_ movie: SharedDomain.MovieEntity) async throws {
    if let result = addOrUpdateMovie {
      switch result {
        case .success: return
        case .failure(let error): throw error
      }
    }
    throw MockError.notImplemented
  }
}

enum MockError: Error {
  case notImplemented
}
