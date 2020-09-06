//
//  BookDetailsVC.swift
//  JeenyTask
//
//  Created by Afaq Ahmad on 06/09/2020.
//  Copyright © 2020 Afaq Ahmad. All rights reserved.
//

import UIKit

class BookDetailsVC: UIViewController {
    
    @IBOutlet weak var bookImageView: UIImageView!
    
    var items: Items?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        let urlString = items?.volumeInfo?.imageLinks?.thumbnail ?? ""
        let httpsurlString = "https" + urlString.dropFirst(4)
        getImageDataFromURL(urlString: httpsurlString)
        
    }
    
    func getImageDataFromURL(urlString: String) {
        
        print("Interactor receives the request from Presenter to get image data from the server.")
        
        KingfisherService.shared.loadImageFrom(urlString: urlString, success: { (data) in
            let image = ImageDataService.shared.convertToUIImage(from: data)
            DispatchQueue.main.async {
                self.bookImageView.image = image
            }
        }) { (error) in
            DispatchQueue.main.async {
                self.bookImageView.image = UIImage(named: "booksIcon")
            }
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
