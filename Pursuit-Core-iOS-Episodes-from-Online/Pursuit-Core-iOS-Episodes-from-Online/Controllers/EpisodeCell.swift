//
//  EpisodeCell.swift
//  Pursuit-Core-iOS-Episodes-from-Online
//
//  Created by Eric Davenport on 12/15/19.
//  Copyright © 2019 Benjamin Stone. All rights reserved.
//

import UIKit

class EpisodeCell: UITableViewCell {
  
  @IBOutlet weak var episodeImageView: UIImageView!
  @IBOutlet weak var episodeTitleLabel: UILabel!
  @IBOutlet weak var episodeNumberLabel: UILabel!
  
  func configureCell(for episode: Episodes) {
//    episodeNumberLabel.text = episode.number.description
//    episodeTitleLabel.text = episode.name
    
    episodeImageView.getImage(with: episode.image?.original ?? "https://static.tvmaze.com/uploads/images/original_untouched/84/212394.jpg") { (result) in
      switch result {
      case .failure:
        DispatchQueue.main.async {
          self.episodeImageView.image = UIImage(systemName: "exlamationmark.triangle")
          self.episodeTitleLabel.text = episode.name
          self.episodeNumberLabel.text = "Season: \(episode.season)/nEpisode: \(episode.number) "
        }
      case .success(let image):
        DispatchQueue.main.async {
          self.episodeImageView.image = image
          self.episodeTitleLabel.text = episode.name
          self.episodeNumberLabel.text = "Season: \(episode.season.description)\nEpisode: \(episode.number.description) "
        }
      }

    }
  }

  
}
