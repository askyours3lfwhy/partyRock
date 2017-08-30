//
//  PartyCell.swift
//  PartyRockApp
//
//  Created by Yordani Awono on 24/06/2017.
//  Copyright © 2017 Yordani Awono. All rights reserved.
//

import UIKit

class PartyCell: UITableViewCell {

    @IBOutlet weak var videoPreviewImage: UIImageView!
    
    @IBOutlet weak var videoTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    // code below is run through everytime new cell is created (or recycled) - hence "updateUI"
    
    func updateUI(partyRock: PartyRock) {
        
        videoTitle.text = partyRock.videoTitle
        
        // here is where images are downloaded for each cell
        
        let url = URL(string: partyRock.imageURL)!
        
        // .async uses background thread to download image so app isn't frozen; after this UIThread is grabbed and .sync puts image to imageview
        
        DispatchQueue.global().async {  }
        do {
            let data = try Data(contentsOf: url)
            DispatchQueue.global().sync {
                self.videoPreviewImage.image = UIImage(data: data)
            }
            
        } catch {
            
            // handle the error
            
        }
    }



}
