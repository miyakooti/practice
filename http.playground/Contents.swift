import Foundation
import PlaygroundSupport
PlaygroundPage.current.needsIndefiniteExecution = true

// URLSessionConfiguration の設定をする
let config = URLSessionConfiguration.default

// URLSession セッションのインスタンスを生成
let session = URLSession(configuration: config)

// URLを作成
var urlComponents = URLComponents(string: "https://itunes.apple.com/search")
urlComponents?.query = "media=music&entity=song&term=justin"
let url = urlComponents?.url

// GET通信を実行
let task = session.dataTask(with: url!) { data, response, error in
  if let error = error {
    print(error.localizedDescription)
    return
  }

  guard let data = data, let response = response as? HTTPURLResponse else {
    print("データがありませんでした。")
    return
  }

  if response.statusCode == 200 {
    do {
      let json = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.allowFragments)
      print(json)
    } catch {
      print("不正なデータです")
    }
    // 処理...
  }
}
task.resume()
