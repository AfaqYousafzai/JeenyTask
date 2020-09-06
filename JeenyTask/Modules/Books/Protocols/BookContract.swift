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
    func onFetchBooksSuccess(items: [Items])
    func onFetchBooksFailure(error: String)
    
    func showHUD()
    func hideHUD()
}


// MARK: View Input (View -> Presenter)
protocol ViewToPresenterBooksProtocol: class {
    
    var view: PresenterToViewBooksProtocol? { get set }
    var interactor: PresenterToInteractorBooksProtocol? { get set }
    var router: PresenterToRouterBooksProtocol? { get set }
    
    func numberOfRowsInSection() -> Int

    func viewDidLoad()
    
    func refresh()
}


// MARK: Interactor Input (Presenter -> Interactor)
protocol PresenterToInteractorBooksProtocol: class {
    
    var presenter: InteractorToPresenterBooksProtocol? { get set }
    
    func loadBooks()
//    func retrieveQuote(at index: Int)
}


// MARK: Interactor Output (Interactor -> Presenter)
protocol InteractorToPresenterBooksProtocol: class {
    
    func fetchBooksSuccess(items: [Items])
    func fetchBooksFailure(errorCode: Int)
    
//    func getBooksSuccess(_ item: Items)
//    func getBooksFailure()
    
}


// MARK: Router Input (Presenter -> Router)
protocol PresenterToRouterBooksProtocol: class {
    
    static func createModule() -> UINavigationController
    
    func pushToBooksDetail(on view: PresenterToViewBooksProtocol, with item: Items)
}
