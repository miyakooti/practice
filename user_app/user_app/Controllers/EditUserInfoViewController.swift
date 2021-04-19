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

final class EditUserInfoViewController: UIViewController {
    
    private let controllerTitle = "空になってしまった項目があります。再度入力してください。"
    private let actionTitle = "わかりました！！！"
    
    // 弱参照
    var delegate: EditUserInfoDelegate?

    @IBOutlet private weak var userNameTextField: UITextField!
    @IBOutlet private weak var birthDayTextField: UITextField!
    @IBOutlet private weak var jobTextField: UITextField!
    
    var userNameText:String = ""
    var birthDayText:String = ""
    var jobText:String = ""
    var indexPath:IndexPath = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userNameTextField.text = userNameText
        birthDayTextField.text = birthDayText
        jobTextField.text = jobText
    }
    
    @IBAction private func backButtonDidTapped(_ sender: Any) {
        
        // guardとは保証
        guard let userNameText = userNameTextField.text,
              let birthDayText = birthDayTextField.text,
              let jobText = jobTextField.text,
              !userNameText.isEmpty, !birthDayText.isEmpty, !jobText.isEmpty else {
            AlertPresenter.presentAlert(viewController: self, controllerTitle: controllerTitle, actionTitle: actionTitle)
            return
        }
        let userInfo = User(name: userNameText,  birthday: birthDayText, job: jobText)
        delegate?.editUserInfo(userInfo: userInfo, indexPath: indexPath)
        dismiss(animated: true, completion: nil)
    }

}
