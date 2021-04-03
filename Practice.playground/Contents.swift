import UIKit


//タプルすげー
let profile = ("kousuke", 20, "kanagawa")
print(profile)

let (myName, myAge, _) = profile
print(myName+"は、"+String(myAge)+"歳です")

print("\(profile.0)です。")


func dice() -> Int{
    let num:Int = Int(1 + arc4random_uniform(6))
    return num
}

for _ in 0...10{
    print(dice())
}

func printDice(){
    print(dice())
}

print("printDiceです")
for _ in 0...10{
    printDice()
}

// ----------------------------------------------------------------------------------------------------


class player {
    
    let name:String
    
    init(name:String = "名無しさん") {
        self.name = name
    }
    
}

let player1 = player()
print(player1.name)

let player2 = player(name: "たかし")
print(player2.name)

// ----------------------------------------------------------------------------------------------------

enum GPA {
    case W, F, D, C, B, A
}

// GPA型のプロパティを代入することによって、W, F, D, C, B, Aしか取り得ないという状況を作り出す。
var seiseki = GPA.B
print(seiseki)

//seiseki = "E" だからこれはエラー

// ----------------------------------------------------------------------------------------------------

