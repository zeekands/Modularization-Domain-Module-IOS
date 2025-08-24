import Foundation

public enum Deeplink {
  case movieDetail(id: Int)
  case tvShowDetail(id: Int)
  case search(query: String?)
  case tab(AppTab)
  
  public static func from(url: URL) -> Deeplink? {
    guard let components = URLComponents(url: url, resolvingAgainstBaseURL: true) else {
      return nil
    }
    
    let host = components.host
    let pathComponents = components.path.split(separator: "/").map(String.init)
    
    switch host {
      case "movie":
        if pathComponents.first == "detail",
           let idString = components.queryItems?.first(where: { $0.name == "id" })?.value,
           let id = Int(idString) {
          return .movieDetail(id: id)
        }
      case "tvshow":
        if pathComponents.first == "detail",
           let idString = components.queryItems?.first(where: { $0.name == "id" })?.value,
           let id = Int(idString) {
          return .tvShowDetail(id: id)
        }
      case "search":
        let query = components.queryItems?.first(where: { $0.name == "query" })?.value
        return .search(query: query)
      case "tab":
        break
      default:
        break
    }
    return nil
  }
  
  public func toAppRoute() -> AppRoute {
    switch self {
      case .movieDetail(let id):
        return .movieDetail(movieId: id)
      case .tvShowDetail(let id):
        return .tvShowDetail(tvShowId: id)
      case .search(_):
        return .search
      case .tab(_):
        fatalError("Deeplink tab cannot be directly converted to AppRoute for push. Handle separately.")
    }
  }
}
