//
//  ItemDetailViewController.swift
//  RxSwiftMVVM
//
//  Created by Faizal on 11/01/1442 AH.
//  Copyright © 1442 Faizal. All rights reserved.
//

import UIKit

class ItemDetailViewController: UIViewController {
    //MARK: Outlets
    @IBOutlet weak var imgItem: UIImageView!
    @IBOutlet weak var lblItemName: UILabel!
    @IBOutlet weak var lblPrice: UILabel!
    @IBOutlet weak var lblItemDesc: UILabel!
    
    //MARK:Properties
    var item:MenuItem?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.setupView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
           super.viewWillAppear(animated)
         self.navigationController?.setNavigationBarHidden(false, animated: animated)
        self.navigationController?.navigationBar.backItem?.title = ""
    }

    func setupView(){
        
        if let item = item{
            DispatchQueue.main.async {
                self.imgItem.image = UIImage.init(named:item.mainImage)
                                             self.lblItemName.text = item.name
                                             self.lblItemDesc.text = item.description
                                             self.lblPrice.text = "$ " + "\(item.price)"
                                   
                         self.navigationItem.title = item.name
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
