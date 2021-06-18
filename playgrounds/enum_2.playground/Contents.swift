import UIKit


enum Direction {
    case up
    case down
    case right
    case left
}

var direction = Direction.up // direction型

print(direction)
print(type(of: direction))

//した２つはエラーになる。めっちゃ厳密にできる。
//direction = "up"
//direction = "hoge"





// 例えば、プロジェクトで使用する色を、めちゃめちゃ厳密に管理することを考える。他の色は許さない、てきな

extension UIColor {
    // initのオーバーロードを明示
    convenience init(hex: String, alpha: CGFloat = 1.0) {
        let v = Int("000000" + hex, radix: 16) ?? 0
        let r = CGFloat(v / Int(powf(256, 2)) % 256) / 255
        let g = CGFloat(v / Int(powf(256, 1)) % 256) / 255
        let b = CGFloat(v / Int(powf(256, 0)) % 256) / 255
        self.init(red: r, green: g, blue: b, alpha: min(max(alpha, 0), 1))
    }
    
    // 「他の色はぜっっったいにだめ！！！」というイメージ。（firebase analyticsの送信とか）
    //    まあ自分のアプリにぶちこむなら、単純にUIColorを拡張して、スタティックプロパティを随時ぶち込んでいけばいい。
    enum ProjectColor {
        case sixTodoPurple
        case sixTodoBackgroundGray
        
        // enumに紐付いたプロパティ。enumのcaseごとに設定する。
        var color: UIColor {
            switch self {
            case .sixTodoPurple: return UIColor(hex: "FFFFFF", alpha: 1)
            case .sixTodoBackgroundGray: return UIColor(hex: "222222", alpha: 1)
            }
    
        }
    }
    
    static func makeColor(projColor: ProjectColor) -> UIColor {
        return projColor.color
    }
    
}
// アクセスするときはこんなかんじ。意外ときれい
let color: UIColor = .makeColor(projColor: .sixTodoBackgroundGray)
