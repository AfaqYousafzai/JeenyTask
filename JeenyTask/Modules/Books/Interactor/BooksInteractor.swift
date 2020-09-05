//
//  BooksInteractor.swift
//  JeenyTask
//
//  Created by Afaq Ahmad on 05/09/2020.
//  Copyright © 2020 Afaq Ahmad. All rights reserved.
//

import Foundation

class BooksInteractor: PresenterToInteractorBooksProtocol {
    
    // MARK: Properties
    weak var presenter: InteractorToPresenterBooksProtocol?
    var items: [Items]?
    
    func loadBooks() {
        print("Interactor receives the request from Presenter to load quotes from the server.")
    }
    
    func retrieveQuote(at index: Int) {
        guard let items = self.items, items.indices.contains(index) else {
            self.presenter?.getQuoteFailure()
            return
        }
        self.presenter?.getQuoteSuccess(self.items![index])
    }

}
