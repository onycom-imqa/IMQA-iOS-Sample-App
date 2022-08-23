//
//  CustomErrorViewController.swift
//  IMQA-Reference-iOS
//
//  Created by 차용빈 on 2022/04/13.
//

import UIKit

class CustomErrorViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func doError(_ sender: Any) {
        let error = NSError(domain: "커스텀 에러가 발생했습니다.", code: 9991, userInfo: nil)
        IMQACrash.notifyError(error)
    }
}
