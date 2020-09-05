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
        
        WebServiceHandler.callWebService(request: BooksRequest()){ response, error, code in
            
            if let _ = error{
                self.presenter?.fetchBooksFailure(errorCode: code)
                //JeenyGeneralElements.showAlertWithMessage("Error occurred.", sender: nil)
            }
            
            guard let data = response else{
                return
            }
            do
            {
                
                let responseDetails = try JSONDecoder().decode(GoogleBooks.self, from: data)
                self.items = responseDetails.items
                
                if code == 200 {
                    self.presenter?.fetchBooksSuccess(items: self.items ?? [])
                }
            }
            catch let err {
                print(err.localizedDescription)
                self.items = nil
                self.presenter?.fetchBooksFailure(errorCode: code)
                //JeenyGeneralElements.showAlertWithMessage("No data available", sender: nil)
            }
            
            
        }
        
    }
    
    func retrieveQuote(at index: Int) {
        guard let items = self.items, items.indices.contains(index) else {
            self.presenter?.getBooksFailure()
            return
        }
        self.presenter?.getBooksSuccess(self.items![index])
    }

}
