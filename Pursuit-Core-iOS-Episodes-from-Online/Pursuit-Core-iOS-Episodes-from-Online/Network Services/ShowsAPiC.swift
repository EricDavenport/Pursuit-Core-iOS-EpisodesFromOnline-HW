//
//  ShowsAPiC.swift
//  Pursuit-Core-iOS-Episodes-from-Online
//
//  Created by Eric Davenport on 12/13/19.
//  Copyright © 2019 Benjamin Stone. All rights reserved.
//

import Foundation

class ShowAPIClient {
  static func fetchShows(for searchQuary: String,
                         completion: @escaping (Result<[Shows], AppError>) -> ()) {
    
  let urlString = "http://api.tvmaze.com/search/shows?q=\(searchQuary)"
  
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
          let shows = try JSONDecoder().decode([Shows].self, from: data)
          completion(.success(shows))
        } catch {
          completion(.failure(.decodingError(error)))
      }
    }
}
}
}
