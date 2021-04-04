//
//  TopTableViewController.swift
//  user_app
//
//  Created by Arai Kousuke on 2021/04/04.
//

import UIKit

class TopTableViewController: UITableViewController {
    
    
    let user1 = userModel(name: "kousuke", birthday: "2020/10/29", job: "学生")
    let user2 = userModel(name: "tom", birthday: "2020/10/29", job: "ニート")
    let user3 = userModel(name: "さいおんじ", birthday: "2020/10/29", job: "サラリーマン")
    
    // 年齢、生年月日、職業
    var userInfoList:[userModel] = []

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userInfoList.append(user1)
        userInfoList.append(user2)
        userInfoList.append(user3)

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
    
}
