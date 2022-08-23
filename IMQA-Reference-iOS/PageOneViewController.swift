//
//  ViewController.swift
//  IMQA-Reference-iOS
//
//  Created by 차용빈 on 2022/04/10.
//

import UIKit

class PageOneViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func goBack(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    


}

