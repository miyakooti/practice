//
//  NavigationViewController.swift
//  viewcontroller_lifecycle
//
//  Created by Arai Kousuke on 2021/05/22.
//

import UIKit

class NavigationViewController: UIViewController {

    @IBOutlet weak var backButton: UINavigationItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        backButton.backBarButtonItem?.title = "戻る"

    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
