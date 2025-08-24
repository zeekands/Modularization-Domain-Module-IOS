import Foundation
import SwiftUI

public enum AppRoute: Hashable, Identifiable {
  public var id: String {
    switch self {
      case .movieList: return "movieList" // Rute utama untuk Movies tab
      case .tvShowList: return "tvShowList" // Rute utama untuk TV Shows tab
      case .favoritesList: return "favoritesList" // Rute utama untuk Favorites tab
      case .movieDetail(let id): return "movieDetail-\(id)"
      case .tvShowDetail(let id): return "tvShowDetail-\(id)"
      case .search: return "search"
      case .about: return "about"
    }
  }
  case movieList(category: MovieCategory) // MovieCategory bisa Popular/Trending
  case tvShowList(category: TVShowCategory) // TVShowCategory bisa Popular/Trending
  case favoritesList(type: FavoriteContentType)
  case movieDetail(movieId: Int)
  case tvShowDetail(tvShowId: Int)
  case search
  case about
}

public enum AppTab: Int, CaseIterable {
  case movies = 0
  case tvShows = 1
  case favorites = 2
  case about = 3
  
  public var index: Int { rawValue }
  
  public init?(index: Int) {
    self.init(rawValue: index)
  }
  
  public var iconName: String {
    switch self {
      case .movies: return "film.fill"
      case .tvShows: return "tv.fill"
      case .favorites: return "star.fill"
      case .about: return "person.fill"
    }
  }
  
  public var rawValueTitle: String {
    switch self {
      case .movies: return "Movies"
      case .tvShows: return "TV Shows"
      case .favorites: return "Favorites"
      case .about: return "about"
    }
  }
}


// Untuk kategori awal film/tv show
public enum MovieCategory: String, CaseIterable, Identifiable, Sendable {
  public var id: String { self.rawValue }
  case popular = "Popular"
  case trending = "Trending"
}

public enum TVShowCategory: String, CaseIterable, Identifiable, Sendable {
  public var id: String { self.rawValue }
  case popular = "Popular"
  case trending = "Trending"
}

public enum FavoriteContentType: String, CaseIterable, Identifiable, Sendable {
  public var id: String { self.rawValue }
  case movies = "Movies"
  case tvShows = "TV Shows"
}


public protocol AppNavigatorProtocol {

  func navigate(to route: AppRoute, inTab tab: AppTab, hideTabBar: Bool)
  func pop(inTab tab: AppTab)
  func popToRoot(inTab tab: AppTab)
  func presentSheet(_ route: AppRoute)
  func dismissSheet()
  func selectTab(_ tab: AppTab)
  func presentGlobalRoute(_ route: AppRoute)
  func dismissGlobalRoute()
}


public extension AppNavigatorProtocol {
  func navigate(to route: AppRoute, inTab tab: AppTab) {
    navigate(to: route, inTab: tab, hideTabBar: false)
  }
}
