//
//  ShowCell.swift
//  Pursuit-Core-iOS-Episodes-from-Online
//
//  Created by Eric Davenport on 12/13/19.
//  Copyright © 2019 Benjamin Stone. All rights reserved.
//

import UIKit

class ShowCell: UITableViewCell {

  @IBOutlet weak var showImageView: UIImageView!
  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var ratingLabel: UILabel!
  
  func configureCell(for show: Show) {
    showImageView.getImage(with: show.image.original) { (result) in
      switch result {
      case .failure:
        DispatchQueue.main.async {
          self.showImageView.image = UIImage(systemName: "exlamationmark.triangle")
        }
      case .success(let image):
        DispatchQueue.main.async {
        self.showImageView.image = image
          self.titleLabel.text = "\(String(describing: show.name))"
          self.ratingLabel.text = "\(String(describing: show.rating.average))"
        }
      }
    }
  }

}
