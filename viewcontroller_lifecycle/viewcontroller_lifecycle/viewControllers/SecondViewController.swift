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
