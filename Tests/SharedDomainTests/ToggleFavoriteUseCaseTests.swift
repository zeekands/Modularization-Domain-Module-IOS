////
////  ToggleFavoriteUseCaseTests.swift
////  SharedDomain
////
////  Created by zeekands on 24/08/25.
////
//
//
//import XCTest
//@testable import SharedDomain
//
//final class ToggleFavoriteUseCaseTests: XCTestCase {
//  
//  var mockRepository: MockMovieRepository!
//  var useCase: ToggleFavorite!
//  
//  override func setUpWithError() throws {
//    mockRepository = MockMovieRepository()
//    useCase = ToggleFavorite(repository: mockRepository)
//  }
//  
//  override func tearDownWithError() throws {
//    mockRepository = nil
//    useCase = nil
//  }
//  
//  @MainActor
//  func testExecute_success() async throws {
//    let movieId = 123
//    let isFavoriteStatus = true
//    mockRepository.toggleFavoriteResult = .success(isFavoriteStatus)
//    
//    let toggledStatus = try await useCase.execute(movieId: movieId, isFavorite: false)
//    
//    XCTAssertEqual(toggledStatus, isFavoriteStatus)
//  }
//  
//  @MainActor
//  func testExecute_failure() async {
//    let movieId = 123
//    let expectedError = MockError.notImplemented
//    mockRepository.toggleFavoriteResult = .failure(expectedError)
//    
//    do {
//      _ = try await useCase.execute(movieId: movieId, isFavorite: false)
//      XCTFail("Expected a failure, but the use case succeeded.")
//    } catch let error as MockError {
//      XCTAssertEqual(error, expectedError)
//    } catch {
//      XCTFail("Expected MockError, but got a different error: \(error)")
//    }
//  }
//}
