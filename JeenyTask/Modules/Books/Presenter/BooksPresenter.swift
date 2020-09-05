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
    
    // MARK: Inputs from view
    func viewDidLoad() {
        print("Presenter is being notified that the View was loaded.")
        //view?.showHUD()
        interactor?.loadBooks()
    }
    
    func refresh() {
        print("Presenter is being notified that the View was refreshed.")
        interactor?.loadBooks()
    }    
    
}

// MARK: - Outputs to view
extension BooksPresenter: InteractorToPresenterBooksProtocol {
    
    func fetchQuotesSuccess(items: [Items]) {
        print("Presenter receives the result from Interactor after it's done its job.")
        
        view?.hideHUD()
        view?.onFetchQuotesSuccess()
    }
    
    func fetchQuotesFailure(errorCode: Int) {
        print("Presenter receives the result from Interactor after it's done its job.")
        view?.hideHUD()
        view?.onFetchQuotesFailure(error: "Couldn't fetch quotes: \(errorCode)")
    }
    
    func getQuoteSuccess(_ item: Items) {
        router?.pushToQuoteDetail(on: view!, with: item)
    }
    
    func getQuoteFailure() {
        view?.hideHUD()
        print("Couldn't retrieve quote by index")
    }
    
    
}
