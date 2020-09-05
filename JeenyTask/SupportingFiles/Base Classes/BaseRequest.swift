//
//  BaseRequest.swift
//  iAppsLearnerApp
//
//  Created by Afaq Ahmad on 30/12/2019.
//  Copyright © 2019 Afaq Ahmad. All rights reserved.
//

import UIKit
import Alamofire

class BaseRequest: NSObject {
    
    var URL = ""
    var requestType : HTTPMethod = HTTPMethod.get
    var message = "Please, Wait."
    var getParams : [String:String] {
        get {
            return [String:String]()
        }
    }
    
//    var authToken : HTTPHeaders {
//        return APIConstants.authHeaders()
//    }
    
    override init() {
        super.init()
    }
    
}
