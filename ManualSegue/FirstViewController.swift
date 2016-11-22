//
//  FirstViewController.swift
//  ManualSegue
//
//  Created by mzgk on 2016/11/22.
//  Copyright © 2016年 mzgk. All rights reserved.
//

/*
 - StoryBoard : FirstViewController → 右クリック → Triggered Segue : manual → SecondViewControllerに接続（show）
 - StoryBoard : Segue → Identifierに「ToSecondScene」を設定
 - Exitメソッドを作成 : @IBAction func unwindToFirstVC(_ segue: UIStoryboardSegue)
*/

import UIKit

class FirstViewController: UIViewController {

    @IBOutlet weak var inoutTextField: UITextField!
    var recieveData = ""


    
// MARK: - ライフサイクル
    override func loadView() {
        super.loadView()
        print("FirstVC :", #function)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        print("FirstVC :", #function)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("FirstVC :", #function)
        // SecondViewControllerから受け取ったデータを設定（InitialViewControllerのviewDidLoadは初回しか処理されない）
        if recieveData.characters.count != 0 {
            inoutTextField.text = recieveData
        }
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        print("FirstVC :", #function)
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        print("FirstVC :", #function)
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        // キーボード表示
        inoutTextField.becomeFirstResponder()
        print("FirstVC :", #function)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("FirstVC :", #function)
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("FirstVC :", #function)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }



// MARK: - 次の画面へ遷移
    @IBAction func tapGoToNextButton(_ sender: UIButton) {
        print("FirstVC :", #function)
        // キーボード閉じる
        view.endEditing(true)
        // Segueを呼び出し遷移開始
        performSegue(withIdentifier: "ToSecondScene", sender: self)
    }

    // Segueが実行されると呼び出される
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print("FirstVC :", #function)
        switch segue.identifier {
        case .some("ToSecondScene"):
            // 移動先のViewControllerのインスタンスを生成し、データを設定
            let dest = segue.destination as! SecondViewController
            dest.recieveData = inoutTextField.text!
        default:
            break
        }
    }



// MARK: - 他画面からの戻る処理（Exitから接続する）
    @IBAction func unwindToFirstVC(_ segue: UIStoryboardSegue) {
         print("FirstVC :", #function)
    }
}

