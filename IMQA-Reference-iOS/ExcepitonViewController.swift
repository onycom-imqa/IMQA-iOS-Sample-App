//
//  ExcepitonViewController.swift
//  IMQA-Reference-iOS
//
//  Created by 차용빈 on 2022/04/13.
//

import UIKit

class ExcepitonViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func doError(_ sender: Any) {
        let someJson : Dictionary = ["foo":self]
        do {
            let data = try JSONSerialization.data(withJSONObject: someJson, options: .prettyPrinted)
            print("Received data: %@", data)
        } catch {
            // Why does this crash the app? A very good question.
        }
    }
    
}
