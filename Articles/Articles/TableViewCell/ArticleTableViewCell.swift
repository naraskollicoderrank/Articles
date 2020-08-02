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
            self.applyEffectstoAvatar()
            self.username.text = user.name
            self.userDesignation.text = user.designation
            setUserImage(user: user)
        }
        if let media = article.media?.first {
            setArticleImage(media: media)
        }
        self.articleContent.text = article.content ?? ""
        self.articleContent.sizeToFit()
        self.articleTitle.text = article.media?.first?.title ?? ""
        self.articleURL.text = article.media?.first?.url ?? ""
        
        let likes = (article.likes ?? 0)/1000
        let comments = (article.comments ?? 0)/1000
        self.likes.text = String(format: "%dK Likes", likes)
        self.comments.text = String(format: "%dK Comments", comments)
    }
    
    func setUserImage(user: User) {
        user.getAvatar(lavatar: user.avatar ?? "",
           successHandler: { (data, error) in
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
        media.getArticleImage(image: media.image ?? "",
          successHandler: { (data, error) in
              if let dataObj = data as? Data {
                  DispatchQueue.main.async {
                      self.articleImageView.image = UIImage(data: dataObj)
                  }
              }
          }, failureHandler: { (data, error) in
              print("setImage failure")
          })
    }
    
    func applyEffectstoAvatar() {
        self.userImageView.layer.masksToBounds = true
        self.userImageView.layer.cornerRadius = self.userImageView.frame.size.width / 2
        self.userImageView.layer.shadowColor = UIColor.black.withAlphaComponent(0.35).cgColor
        self.userImageView.layer.shadowOffset = CGSize(width: 0.5, height: 1.0)
        self.userImageView.layer.shadowRadius = 4
        self.userImageView.layer.shadowOpacity = 0.5
    }
}


