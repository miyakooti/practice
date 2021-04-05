import UIKit
import RealmSwift

class TopTableViewController: UITableViewController{

    
    // 普通のリストと同じように扱っていい。通常のクラスと同じ。
    var userInfoList: Results<UserModel>!
    
    let realm = try! Realm()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUserInfoList()
        tableView.reloadData()

    }
    
    // dismissしたときに呼ばれないっぽい。多分シート型になってるせい。
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        print(realm.objects(UserModel.self))

    }
    

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userInfoList.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
//        ここでdefaults読み込んではいけない理由の考察：
//        読み込む前にnumOfRowInSectionしていると考えられる。読み込む前はuserInfoListは空なので0が返されるため、表示されない。
//        userInfoList = readItemsFromUserDefaults()!

        let userInfo = userInfoList[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as UITableViewCell?
        let userNameLabel = cell?.contentView.viewWithTag(1) as! UILabel
        let birthDayLabel = cell?.contentView.viewWithTag(2) as! UILabel
        let jobLabel = cell?.contentView.viewWithTag(3) as! UILabel
        
        userNameLabel.text = userInfo.userName
        birthDayLabel.text = userInfo.birthDay
        jobLabel.text = userInfo.job
        
        return cell!

    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "goEditUserInfoVC", sender: nil)
    }


    @IBAction func buttonDidTapped(_ sender: Any) {
        performSegue(withIdentifier: "goInputUserInfoVC", sender: nil)
    }
    
    //　selfからsegue利用したときに呼ばれるメソッド
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "goInputUserInfoVC" {
            
            let inputUserInfoVC = segue.destination as? InputUserInfoViewController
            inputUserInfoVC?.delegate = self
            
            
        } else if segue.identifier == "goEditUserInfoVC" {
            
            let editUserInfoVC = segue.destination as? EditUserInfoViewController
            editUserInfoVC?.delegate = self
            let indexPath = tableView.indexPathForSelectedRow
            let userInfo = userInfoList[indexPath!.row]
            // iboutletに直接代入すると、なぜかエラー
            editUserInfoVC?.userNameText = userInfo.userName
            editUserInfoVC?.birthDayText = userInfo.birthDay
            editUserInfoVC?.jobText = userInfo.job
            editUserInfoVC?.indexPath = indexPath!
            
        }
    }
    
    func updateUserInfoList() {
        userInfoList = realm.objects(UserModel.self)
    }

}

extension TopTableViewController: InputUserInfoDelegate{
    func addUserInfo(userName: String, birthDay: String, job: String) {
        
        let userInfo = UserModel()
        
        // realmでも動機とか実装しないなら、通常のクラスとだいたい同じ。
        userInfo.id = userInfoList.count
        userInfo.userName = userName
        userInfo.birthDay = birthDay
        userInfo.job = job
        
        try! realm.write {
            realm.add(userInfo)
            print("addされました。\(userInfo)")
        }
        
        updateUserInfoList()
        tableView.reloadData()

    }
}

extension TopTableViewController: EditUserInfoDelegate{
    
    func editUserInfo(userName: String, birthDay: String, job: String, indexPath: IndexPath) {
        let theUserInfo = realm.objects(UserModel.self).filter("id == \(indexPath.row)").first
        // firstいれないとリスト型になってしまう。
        try! realm.write {
            theUserInfo!.userName = userName
            theUserInfo!.birthDay = birthDay
            theUserInfo!.job = job
        }
        
        updateUserInfoList()
        tableView.reloadData()

    }
}
