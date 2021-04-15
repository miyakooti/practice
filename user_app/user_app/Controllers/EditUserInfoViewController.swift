//
//  EditUserInfoViewController.swift
//  user_app
//
//  Created by Arai Kousuke on 2021/04/05.
//

import UIKit

protocol EditUserInfoDelegate {
    func editUserInfo(userInfo:User, indexPath: IndexPath)
}

class EditUserInfoViewController: UIViewController {
    
    var delegate:EditUserInfoDelegate?

    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var birthDayTextField: UITextField!
    @IBOutlet weak var jobTextField: UITextField!
    
    var userNameText:String = ""
    var birthDayText:String = ""
    var jobText:String = ""

    var indexPath:IndexPath = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        userNameTextField.text = userNameText
        birthDayTextField.text = birthDayText
        jobTextField.text = jobText
    }
    
    @IBAction func backButtonDidTapped(_ sender: Any) {
        
        if userNameTextField.text != "" && birthDayTextField.text != "" && jobTextField.text != "" {
            
        let userInfo = User(name: userNameTextField.text!,  birthday: birthDayTextField.text!, job: jobTextField.text!)
        delegate?.editUserInfo(userInfo: userInfo, indexPath: indexPath)
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
