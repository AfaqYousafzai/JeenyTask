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
    @IBOutlet weak var filterText: UITextField!
    
    var allItems: [Items]?
    var filterItems: [Items]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        setupController()
        setupUI()
        if allItems == nil {
            
            presenter?.viewDidLoad()
        }
        
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
    
    func onFetchBooksSuccess(items: [Items]) {
        print("View receives the response from Presenter and updates itself.")
        allItems = items
        filterItems = items
        filterText.text = ""
        self.tableView.reloadData()
        self.refreshControl.endRefreshing()
    }
    
    func onFetchBooksFailure(error: String) {
        print("View receives the response from Presenter with error: \(error)")
        self.refreshControl.endRefreshing()
        JeenyGeneralElements.showAlertWithMessage("\(error)", sender: nil)
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
        return filterItems?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 104
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BooksCell", for: indexPath) as! BooksCell
        cell.titleLbl.text = filterItems?[indexPath.row].volumeInfo?.title
        
        if let smallImage = filterItems?[indexPath.row].volumeInfo?.imageLinks?.smallThumbnail {
            // Do any additional setup after loading the view.
            let httpsurlString = "https" + smallImage.dropFirst(4)
            DispatchQueue.main.async {
                
                let url = URL(string: httpsurlString)
                cell.bookImageView.kf.setImage(with: url)
                
            }
        }
        else {
            cell.bookImageView.image = UIImage(named: "bookIcon")
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "BookDetailsVC") as? BookDetailsVC
        vc?.items = filterItems?[indexPath.row]
        self.navigationController?.pushViewController(vc!, animated: true)
    }
}

// MARK: - UI Setup
extension BooksVC {
    func setupUI() {
        
        tableView.addSubview(refreshControl)
        
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

extension BooksVC: UITextFieldDelegate {

    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        let searchText = (textField.text as NSString?)?.replacingCharacters(in: range, with: string) ?? string
        if searchText == " " && range.location == 0 {
            return false
        }
        else if searchText == "" {
            
            filterItems?.removeAll()
            filterItems = allItems
        }
        else {
            filterItems?.removeAll()
            filterItems = allItems?.filter({($0.volumeInfo?.title?.lowercased().contains(searchText.lowercased()) ?? false )})

        }
        
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
        return true
    }
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
}

