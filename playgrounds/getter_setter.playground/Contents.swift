import UIKit

protocol priceAndTax {
    var taxIncludedPrice: Double { get set }
}

class Item: priceAndTax {

    var taxExcludedPrice: Double = 100

    var taxIncludedPrice: Double {
        get {
            return taxExcludedPrice * 1.08
        }
        set {
            self.taxExcludedPrice = newValue / 1.08
        }
    }

}

//
//import UIKit
//
//protocol priceAndTax {
//    var taxIncludedPrice: Double { get }
//}
//
//class Item: priceAndTax {
//
//    var taxExcludedPrice: Double = 100
//
//    var taxIncludedPrice: Double {
//        taxExcludedPrice * 1.08
//    }
//
//}
