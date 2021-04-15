//
//  ViewController.swift
//  user_app
//
//  Created by Arai Kousuke on 2021/04/04.
//　おｋ

import UIKit

protocol InputUserInfoDelegate {
    func addUser(user: User)
}

final class InputUserInfoViewController: UIViewController {
    
    var delegate: InputUserInfoDelegate?
    let controllerTitle = "すべての項目を入力してください"
    let actionTitle = "わかりました"

    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var birthDayTextField: UITextField!
    @IBOutlet weak var jobTextField: UITextField!

    @IBAction func addUserButtonDidTapped(_ sender: Any) {
        guard let userNameText = userNameTextField.text,
              let birthDayText = birthDayTextField.text,
              let jobText = jobTextField.text,
              !userNameText.isEmpty && !birthDayText.isEmpty && !jobText.isEmpty else {
            AlertPresenter.presentAlert(viewController: self, controllerTitle: controllerTitle, actionTitle: actionTitle)
            return
        }
        // guardのあとの条件文が保証されている状態での処理。
        let user = User(name: userNameText, birthday: birthDayText, job: jobText)
        //topVCに実行させる
        delegate?.addUser(user: user)
        // 破棄しているのでviewDidLoad呼ばれる。
        dismiss(animated: true, completion: nil)
    }
    
}

