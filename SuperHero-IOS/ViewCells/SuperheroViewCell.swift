//
//  SuperheroViewCell.swift
//  SuperHero-IOS
//
//  Created by Mañanas on 20/5/25.
//

import UIKit

class SuperheroViewCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var avatarimageView: UIImageView!
    
    func render (superhero: Superhero) {
        nameLabel.text = superhero.name
        avatarimageView.loadFrom(url: superhero.image.url)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
