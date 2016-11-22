# 目的
- Sceneを切り替える画面遷移をSegueで実装する
- UIから直接Segueを接続させるのではなく、VC間でmanual接続したSegueをコードで呼び出す
- Scene間で値の受け渡しを行う
- ViewControllerのライフサイクルを確認する


# manual Segue
- ボタンから直接画面へSegue接続するのではなく、VCからVCにSegueを接続する
  - StoryBoard VC右クリック → Triggerd Segue → manual → 遷移先のVCに接続
- ボタンからは、コードでそのSegueを呼び出す（SegueにはIdentifierを設定すること）
  - performSegue(withIdentifier:sender:)
- 値の受け渡しは以下のメソッドをoverrideし、遷移先VCのインスタンスを作成してプロパティに設定する
  - prepare(for:sender:)


# 戻る
- unwind Segueを利用する
  - unwind Segueの処理は、戻り先に定義する
  - @IBAction func unwindToFirstVC(_ segue: UIStoryboardSegue)
- 戻るアクションを起こすSeceneのUIから、上部のExitアイコン経由で接続する
- Document Outlineに追加されたunwindにIdentifierを設定する（prepareで識別できるようになる）


# ライフサイクルの確認
- ViewControllerのライフサイクルを確認できるようにprint()を埋め込み
- Initial ViewControllerのviewDidLoad()は初回しか呼ばれない
