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
    func pushToQuoteDetail(on view: PresenterToViewBooksProtocol, with items: Items) {
        print("QuotesRouter is instructed to push QuoteDetailViewController onto the navigation stack.")
//        let quoteDetailViewController = QuoteDetailRouter.createModule(with: quote)
//            
//        let viewController = view as! QuotesViewController
//        viewController.navigationController?
//            .pushViewController(quoteDetailViewController, animated: true)
        
    }
    
}
