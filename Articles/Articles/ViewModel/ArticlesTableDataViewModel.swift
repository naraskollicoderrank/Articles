//
//  ArticlesTableDataViewModel.swift
//  Articles
//
//  Created by Avika on 03/08/20.
//  Copyright © 2020 Narasimhaiah Kolli. All rights reserved.
//

import UIKit

protocol ArticlesPrefetchDelegate: class {
    func getArticles(index: Int)
}

class ArticlesTableDataViewModel: NSObject {

    weak var viewModel: ArticlesViewModel?
    weak var prefetchdelegate: ArticlesPrefetchDelegate?
    var fromIndex: Int = 1
    
    init(viewModel: ArticlesViewModel) {
        self.viewModel = viewModel
        super.init()
    }
}

extension ArticlesTableDataViewModel: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var count = 1
        if let articleObj = self.viewModel?.articles,articleObj.count > 0 {
            count = articleObj.count
        }
        return count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ArticleTableViewCell.reuseidentifier, for: indexPath) as? ArticleTableViewCell
        if indexPath.row == (self.viewModel?.articles?.count ?? 0) - 1{
          fromIndex += 1
          self.prefetchdelegate?.getArticles(index: fromIndex)
        }
        cell?.selectionStyle = .none
        if let articleObj = self.viewModel?.articles, articleObj.count > indexPath.row {
            cell?.configure(article: articleObj[indexPath.row])
        }
        return cell ?? UITableViewCell()
    }
}

extension ArticlesTableDataViewModel: UITableViewDataSourcePrefetching {
    func tableView(_ tableView: UITableView, prefetchRowsAt indexPaths: [IndexPath]) {
        print("prefetching row of \(indexPaths)")
    }
    func tableView(_ tableView: UITableView, cancelPrefetchingForRowsAt indexPaths: [IndexPath]) {
        print("cancel prefetch of \(indexPaths)")
    }
}
