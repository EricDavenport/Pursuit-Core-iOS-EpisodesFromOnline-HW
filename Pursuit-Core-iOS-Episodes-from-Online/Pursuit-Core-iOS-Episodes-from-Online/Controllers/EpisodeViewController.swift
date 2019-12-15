//
//  EpisodeViewController.swift
//  Pursuit-Core-iOS-Episodes-from-Online
//
//  Created by Eric Davenport on 12/15/19.
//  Copyright © 2019 Benjamin Stone. All rights reserved.
//

import UIKit

class EpisodeViewController: UIViewController {

  
  @IBOutlet weak var tableView: UITableView!
  
  var series: Show!
  
  var episodes = [Episodes]() {
    didSet {
      DispatchQueue.main.async {
        self.tableView.reloadData()
      }
    }
  }

    override func viewDidLoad() {
        super.viewDidLoad()
      tableView.dataSource = self
      tableView.delegate = self
      searchEpisodes(for: series.id)
      
      //print("Variable: \(episodes)")
    
      }
    
  func searchEpisodes(for seriesID: Int) {
    EpisodeListAPIClient.fetchEpisodes(for: seriesID, completion: { (result) in
      switch result {
      case .failure(let appError):
        print("\(appError)")
      case .success(let episodes):
        self.episodes = episodes
        //dump(episodes)
      }
    }
  )
    
  }

}

extension EpisodeViewController: UITableViewDataSource, UITableViewDelegate {
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let episodeCell = tableView.dequeueReusableCell(withIdentifier: "episodeCell", for: indexPath) as? EpisodeCell else {
      fatalError("failed to deque to EpisodeCell properly.")
    }
    
    let episode = episodes[indexPath.row]
    
    episodeCell.configureCell(for: episode)
    
    return episodeCell
    
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return episodes.count
  }
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 240
  }
}
