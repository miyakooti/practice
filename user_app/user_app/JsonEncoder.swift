//
//  JsonEncoder.swift
//  user_app
//
//  Created by Arai Kousuke on 2021/04/04.
//

import Foundation

class JsonEncoder {
    
    // classつけないと、クラスメソッドにならなかった、、
    class func saveItemsToUserDefaults(users: [User]) {
        // [userInfoModel]型をdataにエンコード
        let data = users.map { try! JSONEncoder().encode($0) }
        UserDefaults.standard.set(data as [Any], forKey: Constants.userInfoListKey)
        UserDefaults.standard.synchronize()
    }
    
    class func readItemsFromUserDefaults() -> [User]? {
        guard let items = UserDefaults.standard.array(forKey: Constants.userInfoListKey) as? [Data] else { return [User]() }
        // dataを[userInfoModel]型にエンコード
        let decodedItems = items.map { try! JSONDecoder().decode(User.self, from: $0) }
        return decodedItems
    }
    
}
