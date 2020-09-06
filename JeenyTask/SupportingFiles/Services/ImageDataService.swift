//
//  ImageDataService.swift
//  JeenyTask
//
//  Created by Afaq Ahmad on 06/09/2020.
//  Copyright © 2020 Zafar. All rights reserved.
//

import UIKit

class ImageDataService {
    
    static let shared = { ImageDataService() }()
    
    func convertToUIImage(from data: Data) -> UIImage {
        return UIImage(data: data)!
    }
}
