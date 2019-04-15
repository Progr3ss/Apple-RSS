//
//  AlbumViewer.swift
//  RSS-Demo
//
//  Created by Martin Chibwe on 4/3/19.
//  Copyright © 2019 Martin Chibwe. All rights reserved.
//

import UIKit

class AlbumViewer: UIViewController {
    
    let imageViewAlbum = UIImageView()
    
    var album: Album!
    
    override func loadView() {
        super.loadView()
        
        self.setupView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = album.name
        self.imageViewAlbum.setImage(url: self.album.artworkUrl100, with: UIImage(named: "placeholder"))
    }
    
    @objc private func actionViewiTunes(_ sender: UIButton){
        
        UIApplication.shared.open(URL(string: self.album.url)!, options: [:], completionHandler: nil)
    }
    
    
}


fileprivate extension AlbumViewer{
    
    func setupView(){
        
        let margins = view.layoutMarginsGuide
        
        
        func newLabel() -> UILabel{
            
            let label = UILabel()
            self.view.addSubview(label)
            label.translatesAutoresizingMaskIntoConstraints = false
            label.textAlignment = .center
            label.numberOfLines = 0
            
            label.leadingAnchor.constraint(equalTo: margins.leadingAnchor, constant: 20).isActive = true
            label.trailingAnchor.constraint(equalTo: margins.trailingAnchor, constant: -20).isActive = true
            
            return label
        }
        
        self.view.backgroundColor = .white
        
        self.view.addSubview(self.imageViewAlbum)
        
        
        
        self.imageViewAlbum.translatesAutoresizingMaskIntoConstraints = false
        
        
        self.imageViewAlbum.contentMode = .scaleAspectFill
        self.imageViewAlbum.clipsToBounds = true
        
        self.imageViewAlbum.topAnchor.constraint(equalTo: margins.topAnchor, constant: 40).isActive = true
        self.imageViewAlbum.leadingAnchor.constraint(equalTo: margins.leadingAnchor, constant: 20).isActive = true
        self.imageViewAlbum.trailingAnchor.constraint(equalTo: margins.trailingAnchor, constant: -20).isActive = true
        self.imageViewAlbum.heightAnchor.constraint(equalToConstant: self.view.frame.width-80).isActive = true
        
        let labelName  = newLabel()
        let labelArtist  = newLabel()
        let labelGenre  =  newLabel()
        let labelReleaseDate  = newLabel()
        let labelCopyWriteInfo  = newLabel()
        
        
        labelName.topAnchor.constraint(equalTo: self.imageViewAlbum.bottomAnchor, constant: 12).isActive = true
        labelArtist.topAnchor.constraint(equalTo: labelName.bottomAnchor, constant: 12).isActive = true
        labelGenre.topAnchor.constraint(equalTo: labelArtist.bottomAnchor, constant: 12).isActive = true
        labelReleaseDate.topAnchor.constraint(equalTo: labelGenre.bottomAnchor, constant: 12).isActive = true
        labelCopyWriteInfo.topAnchor.constraint(equalTo: labelReleaseDate.bottomAnchor, constant: 12).isActive = true
        
        labelName.text = self.album.name
        labelArtist.text = self.album.artistName
        
        var genre: String = ""
        
        self.album.genres.forEach { (g) in
            
            genre = genre.count > 1 ? "\(genre), \(g.name)" : g.name
        }
        
        labelGenre.text = genre
        labelReleaseDate.text = self.album.releaseDate
        labelCopyWriteInfo.text = self.album.copyright
        
        let button = UIButton()
        self.view.addSubview(button)
        
        button.layer.cornerRadius = 4.0
        
        button.setTitle("View in iTunes", for: .normal)
        button.backgroundColor = UIColor.orange
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.leadingAnchor.constraint(equalTo: margins.leadingAnchor, constant: 20).isActive = true
        button.trailingAnchor.constraint(equalTo: margins.trailingAnchor, constant: -20).isActive = true
        
        button.heightAnchor.constraint(equalToConstant: 40).isActive = true
        button.bottomAnchor.constraint(equalTo: margins.bottomAnchor, constant: -20).isActive = true
        
        button.addTarget(self, action: #selector(self.actionViewiTunes(_:)), for: .touchUpInside)
    }
}

