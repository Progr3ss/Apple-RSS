//
//  Network.swift
//  RSS-Demo
//
//  Created by Martin Chibwe on 4/3/19.
//  Copyright © 2019 Martin Chibwe. All rights reserved.
//

import Foundation

public class Network{
    
    public class func request(_ url: String, method: String, completion: @escaping(_ data: Data?, _ error: Error?) -> Void){
        
        guard let url = URL(string: url) else{
            
            return completion(nil,NetworkError.invalidURL)
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = method
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            DispatchQueue.main.async {
                
                completion(data,error)
            }
            }.resume()
        
    }
}
