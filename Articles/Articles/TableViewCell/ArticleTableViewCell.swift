//
//  ArticleTableViewCell.swift
//  Articles
//
//  Created by Avika on 02/08/20.
//  Copyright © 2020 Narasimhaiah Kolli. All rights reserved.
//

import UIKit

class ArticleTableViewCell: UITableViewCell {

    static let reuseidentifier = "ArticleTableViewCellIdentifier"
    
    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var username: UILabel!
    @IBOutlet weak var userDesignation: UILabel!
    @IBOutlet weak var articleImageView: UIImageView!
    @IBOutlet weak var articleContent: UILabel!
    @IBOutlet weak var articleTitle: UILabel!
    @IBOutlet weak var articleURL: UILabel!
    @IBOutlet weak var likes: UILabel!
    @IBOutlet weak var comments: UILabel!
    @IBOutlet weak var articleImageHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var articleContentHeightConstraint: NSLayoutConstraint!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    
    func configure(article: Article) {
        if let user = article.user?.first {
            self.username.text = user.name
            self.userDesignation.text = user.designation
            setUserImage(user: user)
        }
        if let media = article.media?.first {
            setArticleImage(media: media)
        }
        self.articleContent.lineBreakMode = .byWordWrapping
        self.articleContent.numberOfLines = 0
        self.articleContent.text = article.content ?? ""
        
        self.articleTitle.lineBreakMode = .byWordWrapping
        self.articleTitle.numberOfLines = 0
        self.articleTitle.text = article.media?.first?.title ?? ""
        
        self.articleURL.lineBreakMode = .byWordWrapping
        self.articleURL.numberOfLines = 0
        self.articleURL.text = article.media?.first?.url ?? ""
        
        let likes = (article.likes ?? 0)/1000
        let comments = (article.comments ?? 0)/1000
        self.likes.text = String(format: "%dK Likes", likes)
        self.comments.text = String(format: "%dK Comments", comments)
    }
    
    func setUserImage(user: User) {
        user.getAvatar(successHandler: { (data, error) in
            if let dataObj = data as? Data {
                DispatchQueue.main.async {
                    self.userImageView.image = UIImage(data: dataObj)
                }
            }
        }, failureHandler: { (data, error) in
            print("setavatar failure")
        })
    }
    
    func setArticleImage(media: Media) {
        media.getArticleImage(successHandler: { (data, error) in
            if let dataObj = data as? Data {
                DispatchQueue.main.async {
                    self.articleImageView.image = UIImage(data: dataObj)
                }
            }
        }, failureHandler: { (data, error) in
            print("setImage failure")
        })
    }
}

