//
//  WebServiceHandler.swift
//  iAppsLearnerApp
//
//  Created by Afaq Ahmad on 27/08/2019.
//  Copyright © 2019 Afaq Ahmad. All rights reserved.
//

import UIKit
import Alamofire

class WebServiceHandler{
    
    // generic base url will be set here on app level
    static var baseUrl = JeenyConfigurations.getBaseURL()

    
    
    
    static func callWebService(request: BaseRequest, completion: @escaping (_ result: Data?, _ error: Error?) -> Void){
        
        //checking for internet reachability
        if JeenyGeneralElements.shared.internetConnectivity == .none {
            JeenyGeneralElements.showAlertWithMessage("No Internet Connection", sender: nil)
            return
        }
                
        let headers: HTTPHeaders = [
            "Content-Type": "application/json",
        ]
        
        
        var parameterEncoding : ParameterEncoding
        
        if request.requestType == HTTPMethod.post {
            
            parameterEncoding = JSONEncoding.default
        }
        else {
           
            parameterEncoding = URLEncoding.default
        }
        
        AF.request(baseUrl + request.URL, method: request.requestType, parameters: request.getParams, encoding: parameterEncoding, headers: headers).responseData { (response:DataResponse<Data, AFError>) in
            
            print(response)
            
            switch response.result{
            case .success(let result):
                completion(result, nil)
            case .failure(let error):
                completion(nil, error)
            }
            
        }
    }
}


extension UIApplication {
    func topViewController(_ base: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {
        switch (base) {
        case let controller as UINavigationController:
            return topViewController(controller.visibleViewController)
        case let controller as UITabBarController:
            return controller.selectedViewController.flatMap { topViewController($0) } ?? base
        default:
            return base?.presentedViewController.flatMap { topViewController($0) } ?? base
        }
    }
}



