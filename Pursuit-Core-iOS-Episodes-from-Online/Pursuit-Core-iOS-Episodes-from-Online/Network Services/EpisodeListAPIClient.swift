//
//  EpisodeListAPIClient.swift
//  Pursuit-Core-iOS-Episodes-from-Online
//
//  Created by Eric Davenport on 12/13/19.
//  Copyright © 2019 Benjamin Stone. All rights reserved.
//

import Foundation

class EpisodeListAPIClient {
  static func fetchEpisodes(for showID: Int,
                            completion: @escaping (Result<[Episodes], AppError>) -> ()) {
    
    let urlString = "http://api.tvmaze.com/shows/\(showID)/episodes"
    
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
          let episodes = try JSONDecoder().decode([Episodes].self, from: data)
          completion(.success(episodes))
        } catch {
          completion(.failure(.decodingError(error)))
        }
      }
    }
    
}
}
