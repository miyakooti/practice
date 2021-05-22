# viewController_lifecycle_app
ライフサイクルを整理したおと思ったときに作成したアプリです。

# 学んだこと
- VCのライフサイクル
- 表示されている画面はヒエラルキーという
- tabbarの遷移イベントは、親のtabbarControllerで取得できる
- tabbarにはselectedIndexという超便利なプロパティがあり、簡単に取得できる。
- tableVC、navigationVCなどのデリゲートは、たとえextensionであったとしても、VCの内部でself.tableViewController?.delegateというふうにアクセスできる。




# 参考文献
- https://shiba1014.medium.com/viewcontroller%E3%81%AE%E3%83%A9%E3%82%A4%E3%83%95%E3%82%B5%E3%82%A4%E3%82%AF%E3%83%AB-37151427bda5
- https://stackoverflow.com/questions/33837475/detect-when-a-tab-bar-item-is-pressed
- https://ja.stackoverflow.com/questions/66974/swift%E3%81%A7%E3%82%BF%E3%83%96%E7%A7%BB%E5%8B%95%E3%82%92%E3%82%B3%E3%83%BC%E3%83%89%E3%81%A7%E8%A1%8C%E3%81%A3%E3%81%9F%E5%A0%B4%E5%90%88%E3%81%AB%E6%A4%9C%E7%9F%A5%E3%81%99%E3%82%8B%E6%96%B9%E6%B3%95%E3%81%AF%E3%81%82%E3%82%8A%E3%81%BE%E3%81%99%E3%81%8B
- https://tech-blog.rakus.co.jp/entry/2018/04/20/120628#:~:text=%E3%82%B3%E3%83%BC%E3%83%AB%E3%83%90%E3%83%83%E3%82%AF%E3%81%A8%E3%81%AF,-%E3%82%AF%E3%83%AD%E3%83%BC%E3%82%B8%E3%83%A3%E3%81%A8%E3%81%AF&text=%E3%82%B3%E3%83%BC%E3%83%AB%E3%83%90%E3%83%83%E3%82%AF%E3%81%A8%E3%81%AF%20%E3%81%82%E3%81%A8,%E9%96%A2%E6%95%B0%E3%82%92%E5%91%BC%E3%81%B6%E3%82%A4%E3%83%A1%E3%83%BC%E3%82%B8%E3%81%A7%E3%81%99%E3%80%82
