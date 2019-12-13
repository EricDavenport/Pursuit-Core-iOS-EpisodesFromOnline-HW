//
//  ShowModel.swift
//  Pursuit-Core-iOS-Episodes-from-Online
//
//  Created by Eric Davenport on 12/13/19.
//  Copyright © 2019 Benjamin Stone. All rights reserved.
//

import Foundation
struct ShowList: Decodable {
  let shows: [Shows]
}

struct Shows: Decodable {
  let id: Int
  let url: String
  let language: String
  let genre: [String]
  let runtime: Int
  let officialSite: String
  let priemiered: String
  let rating: String
  let image: ImageSize
  let summary: String
}

struct ImageSize: Decodable {
  let image: String
  let original: String
}
