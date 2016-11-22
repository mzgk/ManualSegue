//
//  SecondViewController.swift
//  ManualSegue
//
//  Created by mzgk on 2016/11/22.
//  Copyright © 2016年 mzgk. All rights reserved.
//

/*
 - StoryBoard : Exitを右クリックして表示されるPrsenting Segueにある、FirstViewControllerのunwindとボタンを接続
 - StoryBoard : Document Outlineに表示されるunwind SegueにIdentifierを設定（ToFirstScene）
*/

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var inoutTextField: UITextField!
    var recieveData = ""



// MARK: - ライフサイクル
    override func loadView() {
        super.loadView()
        print("SecondVC :", #function)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print("SecondVC :", #function)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("SecondVC :", #function)
        // FirstViewControllerから受け取ったデータを設定
        if recieveData.characters.count != 0 {
            inoutTextField.text = recieveData
        }
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        print("SecondVC :", #function)
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        print("SecondVC :", #function)
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        // キーボード表示
        inoutTextField.becomeFirstResponder()
        print("SecondVC :", #function)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("SecondVC :", #function)
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("SecondVC :", #function)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }



// MARK: - unwind Segueを利用して戻る際に実行される
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print("SecondVC :", #function)
        switch segue.identifier {
        case .some("ToFirstScene"):
            // 移動先のViewControllerのインスタンスを生成し、データを設定
            let dest = segue.destination as! FirstViewController
            dest.recieveData = inoutTextField.text!
            // キーボードを閉じる
            inoutTextField.resignFirstResponder()
        default:
            break
        }
    }

}
