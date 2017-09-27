//
//  MentorViewController.swift
//  makeyourappgreatagain
//
//  Created by Aleksander Lorenc on 20/09/2017.
//

import UIKit

protocol PresentationViewModel {
    var name: String { get }
    var body: String { get }
    var photoUrl: String { get }
}

class PresentationViewController: UIViewController {

    // MARK: - Properties

    var viewModel: PresentationViewModel! {
        didSet {
            self.loadViewIfNeeded()

            self.title = self.viewModel.name
            self.nameLabel.text = self.viewModel.name
            self.descriptionLabel.text = self.viewModel.body
            self.avatarImageView.downloadedFrom(link: self.viewModel.photoUrl)
        }
    }

    // MARK: - Outlets

    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
}
