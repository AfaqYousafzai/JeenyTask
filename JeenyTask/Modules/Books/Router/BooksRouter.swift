//
//  BooksRouter.swift
//  JeenyTask
//
//  Created by Afaq Ahmad on 05/09/2020.
//  Copyright © 2020 Afaq Ahmad. All rights reserved.
//

import UIKit

class BooksRouter: PresenterToRouterBooksProtocol {
    
    
    // MARK: Static methods
    static func createModule() -> UINavigationController {
        
        print("BooksRouter creates the Books module.")
        let viewController = BooksVC()
        let navigationController = UINavigationController(rootViewController: viewController)
        return navigationController
    }
    
    // MARK: - Navigation
    func pushToBooksDetail(on view: PresenterToViewBooksProtocol, with items: Items) {
        print("BooksRouter is instructed to push BooksDetailViewController onto the navigation stack.")
        
    }
    
}
