//
//  ViewController.swift
//  Pursuit-Core-iOS-Episodes-from-Online
//
//  Created by Benjamin Stone on 9/5/19.
//  Copyright © 2019 Benjamin Stone. All rights reserved.
//

import UIKit

class ShowsViewController: UIViewController {

  @IBOutlet weak var tableView: UITableView!

  var shows = [Show]() {
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
      searchShows(searchQuery: "star")
      dump(shows)
    }
  
  // TODO: completion handler
  func searchShows(searchQuery: String) {
    ShowAPIClient.fetchShows(for: searchQuery, completion: {[weak self] (result) in
      switch result {
      case .failure(let appError):
        print("\(appError)")
      case .success(let shows):
        self?.shows = shows
        dump(shows)
        
      }
    }
    )
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    guard let seriesDetailVC = segue.destination as? EpisodeViewController,
      let indexPath = tableView.indexPathForSelectedRow else {
        fatalError("failed to segue to episode vc properly")
    }
    seriesDetailVC.series = shows[indexPath.row]
  }
}


extension ShowsViewController: UITableViewDataSource, UITableViewDelegate {
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let showCell = tableView.dequeueReusableCell(withIdentifier: "showCell", for: indexPath) as? ShowCell else {
      fatalError("failed to deque cell properly")
    }
    let show = shows[indexPath.row]
    
    showCell.configureCell(for: show)
    
    return showCell
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return shows.count
  }
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 265
  }
  
  
}

