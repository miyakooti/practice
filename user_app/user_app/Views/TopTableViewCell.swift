//
//  TopTableViewCell.swift
//  user_app
//
//  Created by Arai Kousuke on 2021/04/15.
//

import UIKit

class TopTableViewCell: UITableViewCell {
    
    static var identifier: String {
        return String(describing: self) // "UserListTableViewCell"と同じ
    }
    static func nib() -> UINib {
        return UINib(nibName: String(describing: self), bundle: nil)
    }

    
    
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var birthDayLabel: UILabel!
    @IBOutlet weak var jobLabel: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(user: User) {
        userNameLabel.text = user.name
        birthDayLabel.text = user.birthday
        jobLabel.text = user.job
    }
    
    
}
