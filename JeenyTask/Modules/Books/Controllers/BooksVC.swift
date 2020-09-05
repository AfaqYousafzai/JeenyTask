//
//  BooksVC.swift
//  JeenyTask
//
//  Created by Afaq Ahmad on 05/09/2020.
//  Copyright © 2020 Afaq Ahmad. All rights reserved.
//

import UIKit
import PKHUD

class BooksVC: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupController()
        setupUI()
        presenter?.viewDidLoad()
    }
    
    // MARK: - Actions
    @objc func refresh() {
        presenter?.refresh()
    }
    
    // MARK: - Properties
    var presenter: ViewToPresenterBooksProtocol?
    
    
    lazy var refreshControl: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        refreshControl.attributedTitle = NSAttributedString(string: "Refreshing")
        refreshControl.addTarget(self, action: #selector(refresh), for: .valueChanged)
        return refreshControl
    }()
    
}

extension BooksVC: PresenterToViewBooksProtocol{
    
    func onFetchQuotesSuccess() {
        print("View receives the response from Presenter and updates itself.")
        self.tableView.reloadData()
        self.refreshControl.endRefreshing()
    }
    
    func onFetchQuotesFailure(error: String) {
        print("View receives the response from Presenter with error: \(error)")
        self.refreshControl.endRefreshing()
    }
    
    func showHUD() {
        HUD.show(.progress, onView: self.view)
    }
    
    func hideHUD() {
        HUD.hide()
    }
    
}

// MARK: - UITableView Delegate & Data Source
extension BooksVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

    }
}

// MARK: - UI Setup
extension BooksVC {
    func setupUI() {
        
        self.navigationItem.title = "Google Books"
    }
    
    func setupController() {
        
        let presenter: ViewToPresenterBooksProtocol & InteractorToPresenterBooksProtocol = BooksPresenter()
        
        self.presenter = presenter
        self.presenter?.router = BooksRouter()
        self.presenter?.view = self
        self.presenter?.interactor = BooksInteractor()
        self.presenter?.interactor?.presenter = presenter
    }
}
