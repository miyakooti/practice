//
//  AlertPresenter.swift
//  user_app
//
//  Created by Arai Kousuke on 2021/04/15.
//

import Foundation
import UIKit

class AlertPresenter {
    
    static func presentAlert(viewController: UIViewController, controllerTitle: String, actionTitle: String) {
        let alertController = UIAlertController(title: controllerTitle, message: nil, preferredStyle: .alert)
        let action = UIAlertAction(title: actionTitle, style: .cancel, handler: nil)
        alertController.addAction(action)
        viewController.present(alertController, animated: true, completion: nil)
    }
    
}
