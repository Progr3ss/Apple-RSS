//
//  Main.swift
//  RSS-Demo
//
//  Created by Martin Chibwe on 4/3/19.
//  Copyright © 2019 Martin Chibwe. All rights reserved.
//

import Foundation
import UIKit

class Main: UITableViewController {
    
    var feed: Feed?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Apple's RSS"
        
        Network.request("https://rss.itunes.apple.com/api/v1/us/apple-music/coming-soon/all/100/explicit.json", method: "GET") { (data, error) in
            
            guard error == nil else{
                
                self.showAlert(message: error!.localizedDescription)
                return
            }
            
            if let data = data{
                
                do{
                    
                    let appleMusic = try JSONDecoder().decode(AppleMusic.self, from: data)
                    self.feed = appleMusic.feed
                    
                    self.tableView.reloadData()
                    
                }catch{
                    self.showAlert(message: error.localizedDescription)
                }
            }else{
                
                self.showAlert(message: "Empty data")
            }
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.feed?.results.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = AlbumCell()
        cell.configure(with: self.feed!.results[indexPath.row])
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let vc = AlbumViewer()
        vc.album = self.feed!.results[indexPath.row]
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 115
    }
    
    
}

