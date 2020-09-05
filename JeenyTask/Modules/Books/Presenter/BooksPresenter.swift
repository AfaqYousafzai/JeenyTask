//
//  BooksPresenter.swift
//  JeenyTask
//
//  Created by Afaq Ahmad on 05/09/2020.
//  Copyright © 2020 Afaq Ahmad. All rights reserved.
//

import Foundation

class BooksPresenter: ViewToPresenterBooksProtocol {
    
    // MARK: Properties
    weak var view: PresenterToViewBooksProtocol?
    var interactor: PresenterToInteractorBooksProtocol?
    var router: PresenterToRouterBooksProtocol?
    
    var counter : Int?
    
    // MARK: Inputs from view
    func viewDidLoad() {
        print("Presenter is being notified that the View was loaded.")
        view?.showHUD()
        interactor?.loadBooks()
    }
    
    func refresh() {
        print("Presenter is being notified that the View was refreshed.")
        interactor?.loadBooks()
    }
    
    func numberOfRowsInSection() -> Int {
        guard let countItems = self.counter else {
            return 0
        }
        
        return countItems
    }
    
}

// MARK: - Outputs to view
extension BooksPresenter: InteractorToPresenterBooksProtocol {
    
    func fetchBooksSuccess(items: [Items]) {
        print("Presenter receives the result from Interactor after it's done its job.")
        counter = items.count
        view?.hideHUD()
        view?.onFetchQuotesSuccess()
    }
    
    func fetchBooksFailure(errorCode: Int) {
        print("Presenter receives the result from Interactor after it's done its job.")
        view?.hideHUD()
        view?.onFetchQuotesFailure(error: "Couldn't fetch quotes: \(errorCode)")
    }
    
    func getBooksSuccess(_ item: Items) {
        router?.pushToQuoteDetail(on: view!, with: item)
    }
    
    func getBooksFailure() {
        view?.hideHUD()
        print("Couldn't retrieve quote by index")
    }
    
    
}
