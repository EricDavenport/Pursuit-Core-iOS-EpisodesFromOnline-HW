//
//  DetailViewController.swift
//  Pursuit-Core-iOS-Episodes-from-Online
//
//  Created by Eric Davenport on 12/15/19.
//  Copyright © 2019 Benjamin Stone. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
  
  @IBOutlet weak var imageView: UIImageView!
  @IBOutlet weak var seasonEpisodLabel: UILabel!
  @IBOutlet weak var descriptionLabel: UILabel!
  
  var episode: Episodes!
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    configureScreen(for: episode)
    
  }
  
  func configureScreen(for episode: Episodes) {
//    navigationItem.title = episode.name
//    seasonEpisodLabel.text = "S: \(episode.season)\nE: \(episode.number)"
//    descriptionLabel.text = "\(episode.summary ?? "N/A" )"
    
    imageView.getImage(with: episode.image?.original ?? "https://static.tvmaze.com/uploads/images/original_untouched/84/212394.jpg") { (result) in
      switch result {
      case .failure:
        DispatchQueue.main.async {
          self.imageView.image = UIImage(systemName: "exlamationmark.triangle")
          self.seasonEpisodLabel.text = "S: \(episode.season)\nE: \(episode.number)"
          self.descriptionLabel.text = "\(episode.summary ?? "N/A" )"
        }
      case .success(let image):
        DispatchQueue.main.async {
          self.imageView.image = image
          self.seasonEpisodLabel.text = "S: \(episode.season)\nE: \(episode.number)"
          self.descriptionLabel.text = "\(episode.summary ?? "N/A" )"
        }
      }

    }
    
  }
  
  
}
