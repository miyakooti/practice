
let name:String?

name = "kousuke"

if let myName = name {
    print("nameに値が格納されています。")
    print("ちなみに値は\(myName)です")
} else {
    print("nilです")
}
