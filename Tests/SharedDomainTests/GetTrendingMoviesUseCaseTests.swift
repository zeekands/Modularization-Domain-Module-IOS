//
//  GetTrendingMoviesUseCaseTests.swift
//  SharedDomain
//
//  Created by zeekands on 24/08/25.
//


import XCTest
@testable import SharedDomain

final class GetTrendingMoviesUseCaseTests: XCTestCase {
  
  var mockRepository: MockMovieRepository!
  var useCase: GetTrendingMovies!
  
  override func setUpWithError() throws {
    mockRepository = MockMovieRepository()
    useCase = GetTrendingMovies(repository: mockRepository)
  }
  
  override func tearDownWithError() throws {
    mockRepository = nil
    useCase = nil
  }
  
  @MainActor
  func testExecute_success() async throws {
    let movies = [
      MovieEntity(id: 1, title: "Trending Movie 1"),
      MovieEntity(id: 2, title: "Trending Movie 2")
    ]
    mockRepository.getTrendingMoviesResult = .success(movies)
    
    let fetchedMovies = try await useCase.execute(page: 1)
    
    XCTAssertEqual(fetchedMovies.count, 2)
    XCTAssertEqual(fetchedMovies.first?.title, "Trending Movie 1")
  }
  
  @MainActor
  func testExecute_failure() async {
    let expectedError = MockError.notImplemented
    mockRepository.getTrendingMoviesResult = .failure(expectedError)
    
    do {
      _ = try await useCase.execute(page: 1)
      XCTFail("Expected a failure, but the use case succeeded.")
    } catch let error as MockError {
      XCTAssertEqual(error, expectedError)
    } catch {
      XCTFail("Expected MockError, but got a different error: \(error)")
    }
  }
}
