//
//  ViewController.swift
//  TableViewBasicApp
//
//  Created by Yudai Asano on 2019/12/24.
//  Copyright © 2019 Yudai Asano. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var taskTableView: UITableView!
    
    // 非オプショナル型のString配列を定義
    // この変数にテキストフィールドから入力した値を保存する．
    var textArray = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /// - Tag: TableViewのデリゲートとデータソースの設定
        taskTableView.delegate = self
        taskTableView.dataSource = self
        
        /// - Tag: TextFieldのデリゲートを設定
        textField.delegate = self
    }
}

// MARK: - UITextFieldDelegateの設定
extension ViewController: UITextFieldDelegate {
    
    /// - Tag: テキストフィールドでリターンキーが入力されたときに呼び出される．
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        // テキストフィールドに入力された値を配列にアペンド
        textArray.append(textField.text!)
        
        // テキストフィールドを閉じる
        textField.resignFirstResponder()
        
        // テキストフィールドの値を初期化する
        textField.text = ""
        
        // テーブルビューをリロードする
        taskTableView.reloadData()
        
        return true
    }
}

// MARK: - UITableViewDelegateの設定
extension ViewController: UITableViewDelegate {
    
}

// MARK: - UITableViewDataSourceの設定
extension ViewController: UITableViewDataSource {
    
    /// - Tag: セクションの数を返す
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    /// - Tag: 行の数を返す
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return textArray.count
    }
    
    /// - Tag: セルの高さの設定を行う
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return view.frame.size.height/6
    }
    
    /// - Tag: セルにデータをセットしてセルを返す
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = taskTableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        cell.textLabel?.text = textArray[indexPath.row]
        cell.imageView!.image = UIImage(named: "checkImage")
        
        // セルの書式設定
        cell.textLabel?.textColor = .white
        cell.textLabel?.font = UIFont.systemFont(ofSize: 30.0)
        cell.textLabel?.font = UIFont.boldSystemFont(ofSize: 30.0)
        ///////////////////////////////////////////////////////
        
        return cell
    }
    
    /// - Tag: セルが選択されたときの処理をを行う
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // タップしたときにその配列の番号の中身を取り出して，値を渡す処理を記述
        let nextVC = storyboard?.instantiateViewController(identifier: "Next") as! NextViewController
        
        nextVC.todoString = textArray[indexPath.row]
        
        navigationController?.pushViewController(nextVC, animated: true)
    }
}
