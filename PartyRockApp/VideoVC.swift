//
//  VideoVC.swift
//  PartyRockApp
//
//  Created by Yordani Awono on 24/06/2017.
//  Copyright © 2017 Yordani Awono. All rights reserved.
//

import UIKit

class VideoVC: UIViewController {
    
    @IBOutlet weak var webView: UIWebView!
    
    @IBOutlet weak var titleLbl: UILabel!
    
    private var _partyRock: PartyRock!
    
    var partyRock: PartyRock {
        get {
        
            return _partyRock
        } set {
            _partyRock = newValue
        }
    
    }

    override func viewDidLoad() {
        super.viewDidLoad()

       titleLbl.text = partyRock.videoTitle
        
        webView.loadHTMLString(partyRock.videoURL, baseURL: nil)
    }

}
