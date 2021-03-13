//
//  TweetCellTableViewCell.swift
//  Twitter
//
//  Created by Nina on 3/7/21.
//  Copyright © 2021 Dan. All rights reserved.
//

import UIKit

class TweetCellTableViewCell: UITableViewCell {
    
    var favorited:Bool = false
    var tweetId: Int = -1

    @IBOutlet weak var profileImageView: UIImageView!

    @IBOutlet weak var userNameLabel: UILabel!
    
    @IBOutlet weak var tweetContent: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    @IBOutlet weak var retweetButton: UIButton!
    
    @IBOutlet weak var favButton: UIButton!
    
    @IBAction func retweet(_ sender: Any) {
        TwitterAPICaller.client?.reTweet(tweetId:tweetId, success: {
            self.setRetweeted(true)
        
        }, failure: { (error) in
            print("Errror in retweeting \(error)")
        })
            

    }
    
    func setRetweeted(_ isRetweeted:Bool) {
        
        if (isRetweeted) {
            retweetButton.setImage(UIImage(named:"retweet-icon-green"), for: UIControl.State.normal)
            retweetButton.isEnabled = false
        } else {
            retweetButton.setImage(UIImage(named:"retweet-icon"), for: UIControl.State.normal)
            retweetButton.isEnabled = true
        }
        
    }
    
    @IBAction func favTweet(_ sender: Any) {
    let toBeFavorited = !favorited
            if (toBeFavorited)
            {
                TwitterAPICaller.client?.favoriteTweet(tweetId:tweetId, success: {
                    self.setFavorite(true)
                
                }, failure: { (error) in
                    print("Favorite did not succeed \(error)")
                })
            }
            
            else{
                TwitterAPICaller.client?.unFavoriteTweet(tweetId: tweetId, success: {
                    self.setFavorite(false)
                }, failure: { (error) in
                    print("Unfavorite did not succeed \(error)" )
                })
            }
        }
    
    
    func setFavorite(_ isFavorited:Bool)
        {
            favorited = isFavorited
            if (favorited)
            {
                favButton.setImage(UIImage(named:"favor-icon-red"), for: UIControl.State.normal)
            }
            else{
                 favButton.setImage(UIImage(named:"favor-icon"), for: UIControl.State.normal)
            }
            
            
            
        }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
