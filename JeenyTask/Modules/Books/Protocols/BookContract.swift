//
//  BookContract.swift
//  JeenyTask
//
//  Created by Afaq Ahmad on 05/09/2020.
//  Copyright © 2020 Afaq Ahmad. All rights reserved.
//

import UIKit


// MARK: View Output (Presenter -> View)
protocol PresenterToViewBooksProtocol: class {
    func onFetchQuotesSuccess()
    func onFetchQuotesFailure(error: String)
    
    func showHUD()
    func hideHUD()
}


// MARK: View Input (View -> Presenter)
protocol ViewToPresenterBooksProtocol: class {
    
    var view: PresenterToViewBooksProtocol? { get set }
    var interactor: PresenterToInteractorBooksProtocol? { get set }
    var router: PresenterToRouterBooksProtocol? { get set }

    func viewDidLoad()
    
    func refresh()
}


// MARK: Interactor Input (Presenter -> Interactor)
protocol PresenterToInteractorBooksProtocol: class {
    
    var presenter: InteractorToPresenterBooksProtocol? { get set }
    
    func loadBooks()
    func retrieveQuote(at index: Int)
}


// MARK: Interactor Output (Interactor -> Presenter)
protocol InteractorToPresenterBooksProtocol: class {
    
    func fetchQuotesSuccess(items: [Items])
    func fetchQuotesFailure(errorCode: Int)
    
    func getQuoteSuccess(_ item: Items)
    func getQuoteFailure()
    
}


// MARK: Router Input (Presenter -> Router)
protocol PresenterToRouterBooksProtocol: class {
    
    static func createModule() -> UINavigationController
    
    func pushToQuoteDetail(on view: PresenterToViewBooksProtocol, with item: Items)
}
