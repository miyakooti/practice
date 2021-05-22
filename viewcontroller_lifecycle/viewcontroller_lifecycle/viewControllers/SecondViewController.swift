//
//  SecondViewController.swift
//  viewcontroller_lifecycle
//
//  Created by Arai Kousuke on 2021/05/22.
//

import UIKit

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func backButtonDidTapper(_ sender: Any) {
        print("modalから戻ります")
        dismiss(animated: true, completion: nil)
    }
    
}
