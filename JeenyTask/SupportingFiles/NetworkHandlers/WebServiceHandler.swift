//
//  WebServiceHandler.swift
//  iAppsLearnerApp
//
//  Created by Afaq Ahmad on 27/08/2019.
//  Copyright © 2019 Afaq Ahmad. All rights reserved.
//

import UIKit
import Alamofire
import PKHUD

class WebServiceHandler{
    
    // generic base url will be set here on app level
    static var baseUrl = JeenyConfigurations.getBaseURL()
    static func callWebService(request: BaseRequest, completion: @escaping (_ result: Data?, _ error: Error?, _ code: Int) -> Void){
        
        //checking for internet reachability
        if JeenyGeneralElements.shared.internetConnectivity == .none {
            HUD.hide()
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
                if let httpStatusCode = response.response?.statusCode {
                    completion(result, nil, httpStatusCode)
                }
                
            case .failure(let error):
                if let httpStatusCode = response.response?.statusCode {
                    completion(nil, error, httpStatusCode)
                }
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



