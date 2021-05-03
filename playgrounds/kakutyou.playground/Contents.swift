
extension Int {
    var twice:Int{
        return self*2
    }
}
// こんなかんじで、IntインスタンスはIntクラスの拡張機能が利用できる。
print(2.twice)

extension String {
    static var hello:String{
        return "こんにちは"
    }
}

// 文字列をクラスに預ける、みたいなことも可能です。！
print(String.hello)
