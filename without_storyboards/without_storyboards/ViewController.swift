//
//  ViewController.swift
//  without_storyboards
//
//  Created by Arai Kousuke on 2021/05/24.
//

import UIKit

class ViewController: UIViewController {
    
    
    let titleLabel: UILabel = {
        let view = UILabel.init() // こ〜やって初期化するんだ
        view.text = "おはようございます"
        view.translatesAutoresizingMaskIntoConstraints = false // autolayoutできるように
        return view
    }()
    
    // lazyとはアクセスされるときに初期化されることを意味する。一切アクセスしないときとかはlazyにすると、メモリ圧迫しなさそう。
    lazy var button: UIButton = {
        let view = UIButton.init()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemBlue
        view.setTitle("下から出てくるやつ", for: .normal)
        view.addTarget(self, action: #selector(openModal(_:)), for: .touchDown)
        return view
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 大元のview
        view.backgroundColor = .white
        
        // あの、qiitaで書いた、ライフサイクルのやつ。
        view.addSubview(titleLabel)
        view.addSubview(button)

        
        // autolayoutコードバージョン
        NSLayoutConstraint.activate([
            titleLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 0),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0),
            button.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
        
        
    }
    

    
    // なぜかselectorで呼んでるやつには@objcついてるよなーーーー　なんでだ
    @objc func openModal(_ sender: UIButton) {
        let modalViewController = ModalViewController.init()
        present(modalViewController, animated: true, completion: nil)
    }
    
    
}

