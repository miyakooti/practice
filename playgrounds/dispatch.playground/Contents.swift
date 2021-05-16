import Foundation
import Dispatch
import PlaygroundSupport
//GCDを用いるか、operationを用いるか、foundationのthreadを用いるか
// プログラマーはキューにどんどん打ち込むことによって、GCDは勝手に最適化してくれる



// GCD ---------------------------

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
