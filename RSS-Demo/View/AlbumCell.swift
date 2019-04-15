//
//  AlbumCell.swift
//  RSS-Demo
//
//  Created by Martin Chibwe on 4/3/19.
//  Copyright © 2019 Martin Chibwe. All rights reserved.
//

import UIKit

class AlbumCell: UITableViewCell {
    
    
    let labelTitle = UILabel()
    let labelSubtitle = UILabel()
    let imageViewArt = UIImageView()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        
        self.loadView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func loadView(){
        
        self.labelSubtitle.numberOfLines = 0
        self.labelTitle.numberOfLines = 0
        
        self.imageViewArt.contentMode = .scaleAspectFill
        self.imageViewArt.clipsToBounds = true
        
        self.addSubview(self.imageViewArt)
        self.addSubview(self.labelTitle)
        self.addSubview(self.labelSubtitle)
        
        self.imageViewArt.translatesAutoresizingMaskIntoConstraints = false
        self.labelSubtitle.translatesAutoresizingMaskIntoConstraints = false
        self.labelTitle.translatesAutoresizingMaskIntoConstraints = false
        
        self.imageViewArt.leftAnchor.constraint(equalToSystemSpacingAfter: self.leftAnchor, multiplier: 1).isActive = true
        self.imageViewArt.topAnchor.constraint(equalToSystemSpacingBelow: self.topAnchor, multiplier: 1).isActive = true
        self.imageViewArt.heightAnchor.constraint(equalToConstant: 100).isActive = true
        self.imageViewArt.widthAnchor.constraint(equalToConstant: 100).isActive  = true
        
        self.labelTitle.topAnchor.constraint(equalToSystemSpacingBelow: self.topAnchor, multiplier: 1).isActive = true
        self.labelTitle.leftAnchor.constraint(equalToSystemSpacingAfter: self.imageViewArt.rightAnchor, multiplier: 1).isActive = true
        self.labelTitle.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        
        self.labelSubtitle.topAnchor.constraint(equalToSystemSpacingBelow: self.labelTitle.bottomAnchor, multiplier: 1).isActive = true
        self.labelSubtitle.leftAnchor.constraint(equalToSystemSpacingAfter: self.imageViewArt.rightAnchor, multiplier: 1).isActive = true
        self.labelSubtitle.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
    }
    
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func configure(with album: Album){
        
        self.labelTitle.text = album.name
        self.labelSubtitle.text =  album.artistName
        self.imageViewArt.setImage(url: album.artworkUrl100, with: UIImage(named: "placeholder"))
        
    }
}

