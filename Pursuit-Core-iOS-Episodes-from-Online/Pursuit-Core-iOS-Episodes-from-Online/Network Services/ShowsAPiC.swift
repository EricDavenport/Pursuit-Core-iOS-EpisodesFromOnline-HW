//
//  ShowsAPiC.swift
//  Pursuit-Core-iOS-Episodes-from-Online
//
//  Created by Eric Davenport on 12/13/19.
//  Copyright © 2019 Benjamin Stone. All rights reserved.
//

import Foundation

class ShowAPIClient {
  static func fetchShows(for searchQuery: String,
                         completion: @escaping (Result<[Show], AppError>) -> ()) {
    
    let searchQuery = searchQuery.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? "friends"
    
  let urlString = "https://api.tvmaze.com/search/shows?q=\(searchQuery)"
  
    guard let url = URL(string: urlString) else {
      completion(.failure(.badURL(urlString)))
      fatalError("bad Url: \(urlString)")
    }
    
    let request = URLRequest(url: url)
  
    NetworkHelper.shared.performDataTask(with: request) { (result) in
      switch result {
      case .failure(let appError):
        completion(.failure(appError))
      case .success(let data):
        do {
          let results = try JSONDecoder().decode([ShowList].self, from: data)
          let shows = results.map { $0.show }
          completion(.success(shows))
        } catch {
          completion(.failure(.decodingError(error)))
      }
    }
}
}
}
