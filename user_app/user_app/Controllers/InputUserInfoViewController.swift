//
//  ViewController.swift
//  user_app
//
//  Created by Arai Kousuke on 2021/04/04.
//

import UIKit

protocol InputUserInfoDelegate {
    func addUserInfo(userName: String, birthDay: String, job:String)
}

class InputUserInfoViewController: UIViewController {
    
    var delegate: InputUserInfoDelegate?

    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var birthDayTextField: UITextField!
    @IBOutlet weak var jobTextField: UITextField!
    
    var indexPath:IndexPath = []

    override func viewDidLoad() {
        super.viewDidLoad()
        

    }
    
    @IBAction func addUserButtonDidTapped(_ sender: Any) {
        if userNameTextField.text != "" && birthDayTextField.text != "" && jobTextField.text != ""{
            
            let userName:String = userNameTextField.text!
            let birthDay:String = birthDayTextField.text!
            let job:String = jobTextField.text!

            //topVCに実行させる
            delegate?.addUserInfo(userName: userName, birthDay: birthDay, job: job)
            
            dismiss(animated: true, completion: nil)
            
        } else {
            presentAlert()
        }
    }
    
    
    
    func presentAlert(){
        let alertController = UIAlertController(title: "すべての項目を入力してください", message: nil, preferredStyle: .alert)
        let action = UIAlertAction(title: "わかりました", style: .cancel, handler: nil)
        alertController.addAction(action)
        self.present(alertController, animated: true, completion: nil)
    }

}

