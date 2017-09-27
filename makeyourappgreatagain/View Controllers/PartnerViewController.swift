//
//  PartnerViewController.swift
//  makeyourappgreatagain
//
//  Created by Aleksander Lorenc on 20/09/2017.
//

import UIKit

class PartnerViewController: UIViewController {

    // MARK: - Properties

    var partner: Partner!

    // MARK: - Outlets

    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var websiteUrlLabel: UILabel!

    // MARK: - Methods

    override func viewDidLoad() {
        self.title = partner.name

        self.nameLabel.text = partner.name
        self.websiteUrlLabel.text = partner.website
        self.avatarImageView.downloadedFrom(link: self.partner.logoUrl)
    }
}
