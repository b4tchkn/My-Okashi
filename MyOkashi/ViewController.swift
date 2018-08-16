//
//  ViewController.swift
//  MyOkashi
//
//  Created by Kakeru Nakabachi on 2018/08/16.
//  Copyright © 2018年 kakeru nakabachi. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UISearchBarDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Search BarのDelegate通知先を設定
        searchText.delegate = self
        
        // 入力のヒントになる，プレースホルダーを設定
        searchText.placeholder = "お菓子の名前を入力してください"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBOutlet weak var searchText: UISearchBar!
    
    @IBOutlet weak var tableView: UITableView!
    
    // 検索ボタンタップ時
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        // キーボード閉じる
        view.endEditing(true)
        
        if let searchWord = searchBar.text {
            // デバッグエリアに出力
            print(searchWord)
            // 入力されていたら，お菓子を検索
            searchOkashi(keyword: searchWord)
        }
    }
    
    // searchOkashiメソッド
    // 第一引数：keyword 検索したいキーワード
    func searchOkashi(keyword : String) {
        // お菓子の検索キーワードをURLエンコードする
        guard let keyword_encode = keyword.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else {
            return
        }
        
        // リクエストURLの組み立て
        guard let req_url = URL(string: "http://www.sysbird.jp/toriko/api/?apikey=guest&format=json&keyword=\(keyword_encode)&max=10&order=r") else {
            return
        }
        print(req_url)
    }
}

