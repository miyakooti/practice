import UIKit

class FirstViewController: UIViewController {

    override func loadView() {
        super.loadView()
        print("loadView")
        // viewを生成したときに一度だけ呼ばれる。通常オーバーラードしてはいけない
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("viewDidLoad")
        // viewをメモリに読み込んだときに一度だけ呼ばれる。
        // navigation barで戻るときや、modalを閉じるときには呼ばれない
        // dismissはVCをメモリからも排除するので、再度ロードすると呼ばれる
        self.tabBarController?.delegate = self
        self.navigationController?.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("viewWillAppear")
        // viewが画面に表示される直前に呼ばれるメソッド。（ヒエラルキーに追加されると言う）
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("viewDidAppear")
        // viewが画面に表示された直後に呼ばれるメソッド。テーブルビューとかのメソッドとこのメソッドはどっちが早いのだろう。
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        print("viewWillLayoutSubviews")
        // UIパーツをaddsubViewするときや、デバイスの画面の向きを変える直前に呼ばれるメソッド。
        // 見た目の変更をするたびに、というイメージ。
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        print("viewDidLayoutSubviews")
        // 見た目が確定した直後に呼ばれるメソッド。かな？
        // boundsが確定する。
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("viewWillDisappear")
        // viewが画面から削除される直前に呼ばれるメソッド。
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("viewDidDisappear")
        // viewが画面から削除された直後に呼ばれるメソッド。
    }


    @IBAction func nomalTransitionButtonDidTapped(_ sender: Any) {
        print("modalに遷移します")
        performSegue(withIdentifier: .showSecondKey , sender: nil)
    }
    

}

// navigationでの遷移
extension FirstViewController: UINavigationControllerDelegate {
    
    func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {
        print("navigation Barで遷移しています")
    }
}

// Tabbarでの遷移
extension FirstViewController: UITabBarControllerDelegate {
    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        let tabBarIndex = tabBarController.selectedIndex
        switch tabBarIndex {
        case 1:
            print("tabbarで遷移しています。")
        default:
            print("tabbarでの遷移先から戻っています。")
        }
    }

}
