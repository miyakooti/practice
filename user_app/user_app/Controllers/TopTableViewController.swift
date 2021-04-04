import UIKit

class TopTableViewController: UITableViewController{

    let defaults = UserDefaults.standard
    let userInfoListKey = "userInfoList"
    
    var userInfoList:[userModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

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


    @IBAction func buttonDidTapped(_ sender: Any) {
        performSegue(withIdentifier: "goInputUserInfoVC", sender: nil)
    }
    
    //　selfからsegue利用したときに呼ばれるメソッド
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goInputUserInfoVC" {
            let inputUserInfoVC = segue.destination as? InputUserInfoViewController
            inputUserInfoVC?.delegate = self
        }
    }
}

extension TopTableViewController: InputUserInfoDelegate{
    func saveToUserDefaults(userInfo: userModel) {
        userInfoList.append(userInfo)
        tableView.reloadData()
    }
}
