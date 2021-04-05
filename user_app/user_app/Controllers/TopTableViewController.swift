import UIKit

//　大域変数にしたいけど、かくばしょはここであっているのだろうか、、
let defaults = UserDefaults.standard

class TopTableViewController: UITableViewController{

    var userInfoList:[userInfoModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 起動時だけしか読み込まないけど、見た目的にはここでいい気がする。一覧表示するたびに読み込むにはたぶんviewWillAppear?
        userInfoList = JsonEncoder.readItemsFromUserDefaults()!

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
        
        userNameLabel.text = userInfo.name
        birthDayLabel.text = userInfo.birthday
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
            editUserInfoVC?.userNameText = userInfo.name
            editUserInfoVC?.birthDayText = userInfo.birthday
            editUserInfoVC?.jobText = userInfo.job
            editUserInfoVC?.indexPath = indexPath!
            
        }
    }

}

extension TopTableViewController: InputUserInfoDelegate{
    func addUserInfo(userInfo: userInfoModel) {

        userInfoList.append(userInfo)
        
//        A default object must be a property list—that is, an instance of (or for collections, a combination of instances of) NSData, NSString, NSNumber, NSDate, NSArray, or NSDictionary. If you want to stｆore any other type of object, you should typically archive it to create an instance of NSData.
        JsonEncoder.saveItemsToUserDefaults(userInfoList: userInfoList)
        tableView.reloadData()
    }
}

extension TopTableViewController: EditUserInfoDelegate{
    func editUserInfo(userInfo: userInfoModel, indexPath: IndexPath) {
        userInfoList[indexPath.row] = userInfo
        JsonEncoder.saveItemsToUserDefaults(userInfoList: userInfoList)
        tableView.reloadData()
    }}
