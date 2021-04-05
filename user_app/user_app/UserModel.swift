//
//  UserModel.swift
//  user_app
//
//  Created by Arai Kousuke on 2021/04/04.
//

import Foundation
import RealmSwift

class UserModel: Object{
    @objc dynamic var id: Int = 0
    @objc dynamic var userName: String = ""
    @objc dynamic var birthDay: String = ""
    @objc dynamic var job: String = ""
}
