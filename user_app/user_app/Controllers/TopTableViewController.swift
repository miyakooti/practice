import UIKit

final class TopTableViewController: UITableViewController{

    private var users:[User] = []
    private let showEditUserInfoId = "showEditUserInfoVC"
    private let showInputUserInfoId = "showInputUserInfoVC"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        users = JsonEncoder.readItemsFromUserDefaults()!
        tableView.register(TopTableViewCell.nib(), forCellReuseIdentifier: TopTableViewCell.identifier)
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TopTableViewCell.identifier) as! TopTableViewCell
        let user = users[indexPath.row]
        cell.configure(user: user)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: showEditUserInfoId, sender: nil)
    }


    @IBAction func buttonDidTapped(_ sender: Any) {
        performSegue(withIdentifier: showInputUserInfoId, sender: nil)
    }
    
    //　selfからsegue利用したときに呼ばれるメソッド
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == showInputUserInfoId {
            let inputUserInfoVC = segue.destination as? InputUserInfoViewController
            inputUserInfoVC?.delegate = self
        } else if segue.identifier == showEditUserInfoId {
            let editUserInfoVC = segue.destination as? EditUserInfoViewController
            editUserInfoVC?.delegate = self
            let indexPath = tableView.indexPathForSelectedRow
            let userInfo = users[indexPath!.row]
            
            // iboutletに直接代入すると、なぜかエラーおきるので、一旦String変数に渡す
            editUserInfoVC?.userNameText = userInfo.name
            editUserInfoVC?.birthDayText = userInfo.birthday
            editUserInfoVC?.jobText = userInfo.job
            editUserInfoVC?.indexPath = indexPath!
        }
    }
}

extension TopTableViewController: InputUserInfoDelegate{
    func addUser(user: User) {
        users.append(user)
        JsonEncoder.saveItemsToUserDefaults(users: users)
        tableView.reloadData()
    }
}

extension TopTableViewController: EditUserInfoDelegate{
    func editUserInfo(userInfo: User, indexPath: IndexPath) {
        users[indexPath.row] = userInfo
        JsonEncoder.saveItemsToUserDefaults(users: users)
        tableView.reloadData()
    }
}
