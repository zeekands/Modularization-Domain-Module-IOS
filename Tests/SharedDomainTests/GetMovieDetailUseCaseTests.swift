//
//  GetMovieDetailUseCaseTests.swift
//  SharedDomain
//
//  Created by zeekands on 24/08/25.
//


import XCTest
@testable import SharedDomain

final class GetMovieDetailUseCaseTests: XCTestCase {
  
  var mockRepository: MockMovieRepository!
  var useCase: GetMovieDetail!
  
  override func setUpWithError() throws {
    mockRepository = MockMovieRepository()
    useCase = GetMovieDetail(repository: mockRepository)
  }
  
  override func tearDownWithError() throws {
    mockRepository = nil
    useCase = nil
  }
  
  @MainActor
  func testExecute_success() async throws {
    let movieId = 123
    let movie = MovieEntity(id: movieId, title: "Detailed Movie")
    mockRepository.getMovieDetailsResult = .success(movie)
    
    let fetchedMovie = try await useCase.execute(id: movieId)
    
    XCTAssertEqual(fetchedMovie?.id, movieId)
    XCTAssertEqual(fetchedMovie?.title, "Detailed Movie")
  }
  
  @MainActor
  func testExecute_failure() async {
    let movieId = 123
    let expectedError = MockError.notImplemented
    mockRepository.getMovieDetailsResult = .failure(expectedError)
    
    do {
      _ = try await useCase.execute(id: movieId)
      XCTFail("Expected a failure, but the use case succeeded.")
    } catch let error as MockError {
      XCTAssertEqual(error, expectedError)
    } catch {
      XCTFail("Expected MockError, but got a different error: \(error)")
    }
  }
}
