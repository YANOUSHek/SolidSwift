//
//  EntityCell.swift
//  makeyourappgreatagain
//
//  Created by Aleksander Lorenc on 20/09/2017.
//

import Foundation
import UIKit

protocol EntityCellViewModel {
    var name: String { get }
    var photoUrl: String { get }
    var margin: CGFloat { get }
}

extension EntityCellViewModel {
    var margin: CGFloat {
        return 0.0
    }
}

class EntityCell: UITableViewCell {
    @IBOutlet var picture: UIImageView!
    @IBOutlet var name: UILabel!
    @IBOutlet weak var imageTrailingConstraint: NSLayoutConstraint!
    @IBOutlet weak var imageLeadingConstraint: NSLayoutConstraint!
    @IBOutlet weak var imageAspectRatio: NSLayoutConstraint!

    func configure(with viewModel: EntityCellViewModel) {
        self.name.text = viewModel.name
        self.picture.downloadedFrom(link: viewModel.photoUrl)
        self.imageLeadingConstraint.constant = viewModel.margin
        self.imageTrailingConstraint.constant = viewModel.margin

        self.backgroundColor = UIColor.customDarkGray

        let bgColorView = UIView()
        bgColorView.backgroundColor = UIColor.customGray
        self.selectedBackgroundView = bgColorView
    }
}
