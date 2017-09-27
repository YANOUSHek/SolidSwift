//
//  MentorExtensions.swift
//  makeyourappgreatagain
//
//  Created by Janusz Bossy on 27/09/2017.
//

import Foundation
import UIKit

extension Mentor: PresentationViewModel {
    var body: String {
        return self.description
    }
}

extension Mentor: EntityCellViewModel { }
