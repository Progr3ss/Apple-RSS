//
//  Feed.swift
//  RSS-Demo
//
//  Created by Martin Chibwe on 4/3/19.
//  Copyright © 2019 Martin Chibwe. All rights reserved.
//

import Foundation

public struct AppleMusic: Decodable{
    
    let feed: Feed
}

public struct Feed: Decodable{
    
    let title: String
    let id: String
    
    let author: Author
    let links: [[String:String]]
    let copyright: String
    let country: String
    let icon: String
    let updated: String
    
    let results:[Album]
}

public struct Author: Decodable{
    
    let name: String
    let uri: String
}

public struct Album: Decodable{
    
    let artistName: String
    let id: String
    let releaseDate: String
    let name: String
    let kind: String
    let copyright: String
    let artistId: String
    let artistUrl: String
    let artworkUrl100: String
    
    let genres: [Genre]
    let url: String
}

public struct Genre: Decodable{
    
    let genreId: String
    let name: String
    let url: String
    
}

