//
//  JsonEncoder.swift
//  user_app
//
//  Created by Arai Kousuke on 2021/04/04.
//

import Foundation

class JsonEncoder {
    
    // classつけないと、クラスメソッドにならなかった、、
    class func saveItemsToUserDefaults(userInfoList: [userInfoModel]) {
        // [userInfoModel]型をdataにエンコード
        let data = userInfoList.map { try! JSONEncoder().encode($0) }
        defaults.set(data as [Any], forKey: Constants.userInfoListKey)
        defaults.synchronize()
    }
    
    class func readItemsFromUserDefaults() -> [userInfoModel]? {
        guard let items = defaults.array(forKey: Constants.userInfoListKey) as? [Data] else { return [userInfoModel]() }
        // dataを[userInfoModel]型にエンコード
        let decodedItems = items.map { try! JSONDecoder().decode(userInfoModel.self, from: $0) }
        return decodedItems
    }
    
}
