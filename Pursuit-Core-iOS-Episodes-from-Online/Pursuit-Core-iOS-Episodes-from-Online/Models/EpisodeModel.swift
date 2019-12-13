//
//  EpisodeModel.swift
//  Pursuit-Core-iOS-Episodes-from-Online
//
//  Created by Eric Davenport on 12/13/19.
//  Copyright © 2019 Benjamin Stone. All rights reserved.
//

import Foundation

struct Episodes: Decodable {
  let id: Int
  let url: String
  let name: String
  let season: Int
  let number: Int
  let airdate: String
  let runtime: Int
  let image: [String:String]
  let summary: String
  
}

