//クロージャとは
//
//
//処理の流れをまとめたもの
//
//pythonでいうラムダ式
//引数としてクロージャを与えれる
//変数に代入できる
//



let dispHello = { print("hello") }

dispHello()

func dispHelloManyTimes(count: Int, task:()->()) {
    for _ in 0...count {
        task()
    }
}

dispHelloManyTimes(count: 10, task: dispHello)
