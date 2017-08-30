//
//  ViewController.swift
//  PartyRockApp
//
//  Created by Yordani Awono on 24/06/2017.
//  Copyright © 2017 Yordani Awono. All rights reserved.
//

import UIKit

class MainVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var partyRocks = [PartyRock]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let p1 = PartyRock(imageURL: "https://draw.acharts.net/artist/redfoo-54661f3e58d4e-l.png", videoURL: "<iframe width=\"560\" height=\"315\" src=\"https:// www.youtube.com/embed/ev4bY1SkZLg\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "Lights Out")
        
        let p2 = PartyRock(imageURL: "https://upload.wikimedia.org/wikipedia/en/b/b7/Redfoo-Let%27s-Get-Ridiculous.jpg", videoURL: "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/CdLhdrNgGu4\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "Let's Get Ridiculous")
        
        let p3 = PartyRock(imageURL: "https://upload.wikimedia.org/wikipedia/en/2/21/Redfoo_-_Juicy_Wiggle_%28cover%29.jpg", videoURL: "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/vg_nvEGryA4\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "Juicy Wiggle Lesson")
        
        let p4 = PartyRock(imageURL: "https://s-media-cache-ak0.pinimg.com/originals/66/f2/76/66f276421c111fd35d9362a7afa1e09e.jpg", videoURL: "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/rZgIYvFu-FQ\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "Party Rock Commercial")
        
        let p5 = PartyRock(imageURL: "https://i.ytimg.com/vi/J7MQDULNIdU/maxresdefault.jpg", videoURL: "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/tWyuglGCKgE\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "Juicy Wiggle")
        
        
        partyRocks.append(p1)
        partyRocks.append(p2)
        partyRocks.append(p3)
        partyRocks.append(p4)
        partyRocks.append(p5)
        
        tableView.delegate = self 
        tableView.dataSource = self
        
    }
    
    // method below will update UI with data in partyRocks array in partyRock cell given that party rock is there and has the information to fill the cell with; else it will return an empty UITableViewCell()
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "PartyCell", for: indexPath) as? PartyCell {
            
            let partyRock = partyRocks[indexPath.row]
            
            cell.updateUI(partyRock: partyRock)
            
            return cell
            
        } else {
        
            return UITableViewCell()
        }
    }
    
    // code below will create new cells (Rows) for each index in partyRocks
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return partyRocks.count
    }
    
    // when user selects cell the code below will perform a segue to VideoVC with the cell being the "sender" to that VC
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let partyRock = partyRocks[indexPath.row]
        
        performSegue(withIdentifier: "VideoVC", sender: partyRock)
    }
    
    // this function below actually makes the segue happen if the destination VC is Video VC and the sender is of the PartyRock class. "partyRock" refers to "partyRock" in the VideoVC file because its in a closure within a property referencing VideoVC
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let destination = segue.destination as? VideoVC {
        
            if let party = sender as? PartyRock {
                
                destination.partyRock = party
            
            }
        }
    }

    


}

