import Foundation
import Dispatch
import PlaygroundSupport
//GCDを用いるか、operationを用いるか、foundationのthreadを用いるか
// プログラマーはキューにどんどん打ち込むことによって、GCDは勝手に最適化してくれる




// GCD ---------------------------------------------------------------------------------

//メインキューとグローバルキューがある。メインキューは直列。グローバルキューは並列で、優先度を指定する。

// 既存のディスパッチキューの取得
let mainQueue = DispatchQueue.main

// グローバルキューの取得
let globalQueueUserInitiated = DispatchQueue.global(qos: .userInitiated) // 優先度的なやつ
let globalQueueBackground = DispatchQueue.global(qos: .background)

//ディスパッチキュー型のイニシャライザで新たに生成することもできる。
let queue = DispatchQueue(label: "init_made_que", qos: .default, attributes: [.concurrent])

// キューにタスクを追加してみましょう。
globalQueueBackground.async {
    Thread.isMainThread
    print("background")
}

globalQueueUserInitiated.async {
    Thread.isMainThread // false 現在の処理がメインスレッドで行われているか？　非同期なのでfalse
    print("userinitiated") // こっちよりも
}

print("同期の処理です") // こっちのほうが早く出力される

// スレッドの処理が比較的単純なときに使うらしい




// operation ---------------------------------------------------------------------------

class SomeOperation: Operation {
    
    let number: Int
    init(number: Int) {
        self.number = number
    }
    
    override func main() {
        Thread.sleep(forTimeInterval: 1)
        print(number)
    }
}

let operationQueue = OperationQueue()
operationQueue.name = "こんにちは"
operationQueue.maxConcurrentOperationCount = 2
operationQueue.qualityOfService = .userInitiated // 優先度的なやつ

var operations = [SomeOperation]()

for i in 0...11 {
    operations.append(SomeOperation(number: i))
}

operationQueue.addOperations(operations, waitUntilFinished: false)
print("operations are added") // 0 1 2 3 4 5 6 7 8 9 11 10
