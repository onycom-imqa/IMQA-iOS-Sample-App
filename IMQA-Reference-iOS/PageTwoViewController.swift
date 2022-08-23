//
//  ViewController.swift
//  IMQA-Reference-iOS
//
//  Created by 차용빈 on 2022/04/10.
//

import UIKit

class PageTwoViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func goBack(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func goHome(_ sender: Any) {
        navigationController?.popToRootViewController(animated: true)
    }
}

