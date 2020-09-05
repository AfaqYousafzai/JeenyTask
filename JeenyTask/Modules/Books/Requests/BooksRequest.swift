//
//  BooksRequest.swift
//  JeenyTask
//
//  Created by Afaq Ahmad on 05/09/2020.
//  Copyright © 2020 Afaq Ahmad. All rights reserved.
//

import UIKit
import Alamofire

class BooksRequest: BaseRequest {
    
    override var getParams: [String : String] {
        get {
            let dicParams : [String : String] = [:]
            return dicParams
        }
    }
    
    
    override var URL: String {
        get {
            return APIEndPoints.BooksEndPoint.V1.rawValue
        }
        set {
            // nothing, because only red is allowed
        }
    }
    
    override var requestType: HTTPMethod {
        get {
            return .get
        }
        set {
            
        }
    }
    
    
    
    
    override init() {
        super.init()
    }
    
    
}
