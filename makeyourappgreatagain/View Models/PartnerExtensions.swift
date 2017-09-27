//
//  PartnerExtensions.swift
//  makeyourappgreatagain
//
//  Created by Janusz Bossy on 27/09/2017.
//

import Foundation
import UIKit

extension Partner: PresentationViewModel {
    var body: String {
        return self.website
    }

    var photoUrl: String {
        return self.logoUrl
    }
}

extension Partner: EntityCellViewModel {
    var margin: CGFloat {
        return 20.0
    }
}
