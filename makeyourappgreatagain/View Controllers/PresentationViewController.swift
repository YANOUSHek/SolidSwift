//
//  MentorViewController.swift
//  makeyourappgreatagain
//
//  Created by Aleksander Lorenc on 20/09/2017.
//

import UIKit

class MentorViewController: UIViewController {

    // MARK: - Properties

    var mentor: Mentor!

    // MARK: - Outlets

    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!

    // MARK: - Methods

    override func viewDidLoad() {
        self.title = mentor.name

        self.nameLabel.text = mentor.name
        self.avatarImageView.downloadedFrom(link: self.mentor.photoUrl)
        self.descriptionLabel.text = self.mentor.description
    }
}
