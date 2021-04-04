//
//  ViewController.swift
//  user_app
//
//  Created by Arai Kousuke on 2021/04/04.
//

import UIKit

protocol InputUserInfoDelegate {
    func saveToUserDefaults(userInfo: userModel)
}

class InputUserInfoViewController: UIViewController {
    
    var delegate: InputUserInfoDelegate?

    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var birthDayTextField: UITextField!
    @IBOutlet weak var jobTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        

    }
    
    @IBAction func addUserButtonDidTapped(_ sender: Any) {
        if userNameTextField.text != "" && birthDayTextField.text != "" && jobTextField.text != ""{
            
            let userName:String = userNameTextField.text!
            let birthDay:String = birthDayTextField.text!
            let job:String = jobTextField.text!

            let userInfo = userModel(name: userName, birthday: birthDay, job: job)
            
            //topVCに実行させる
            delegate?.saveToUserDefaults(userInfo: userInfo)
            
            dismiss(animated: true, completion: nil)
            
        }
    }
    


}

