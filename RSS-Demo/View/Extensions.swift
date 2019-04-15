//
//  Extensions.swift
//  RSS-Demo
//
//  Created by Martin Chibwe on 4/3/19.
//  Copyright © 2019 Martin Chibwe. All rights reserved.
//

import UIKit

// UIViewController

let imageCache = NSCache<AnyObject, AnyObject>()


public extension UIViewController{
    
    func showAlert(message: String){
        
        let controller  = UIAlertController(title: "Apple’s RSS", message: message, preferredStyle: .alert)
        controller.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
        self.present(controller, animated: true, completion: nil)
    }
}

public extension UIImageView{
    
    func setImage(url: String, with placeHolder: UIImage?){
        
        self.image = placeHolder
        if let imageFromCache = imageCache.object(forKey: url as AnyObject) as? UIImage {
            self.image = imageFromCache
            return
            
        }else{
            
            URLSession.shared.dataTask(with: URL(string: url)!) {
                data, response, error in
                
                DispatchQueue.main.async {
                    
                    if let data = data {
                        let imageToCache = UIImage(data: data)
                        imageCache.setObject(imageToCache!, forKey: url as AnyObject)
                        self.image = imageToCache
                    }
                }
                
                }.resume()
        }
    }
}

