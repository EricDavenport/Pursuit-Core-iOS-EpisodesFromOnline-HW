//
//  ShowModel.swift
//  Pursuit-Core-iOS-Episodes-from-Online
//
//  Created by Eric Davenport on 12/13/19.
//  Copyright © 2019 Benjamin Stone. All rights reserved.
//

import Foundation
struct ShowList: Decodable {
  let show: Show
}

struct Show: Decodable {
  let name: String
  let id: Int
//  let url: String
//  let language: String
//  let genres: [String]
//  let runtime: Int
//  let officialSite: String?
//  let premiered: String
  let rating: Average
  let image: ImageSize?
//  let summary: String?
}

struct ImageSize: Decodable {
  let medium: String
  let original: String
}

struct Average: Decodable {
  let average: Double?
}
