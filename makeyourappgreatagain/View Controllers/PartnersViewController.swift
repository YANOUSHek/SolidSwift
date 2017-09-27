//
//  PartnersViewController.swift
//  makeyourappgreatagain
//
//  Created by Aleksander Lorenc on 20/09/2017.
//

import UIKit
import Alamofire
import SwiftyJSON

class PartnersViewController: UITableViewController {

    static let entityCell = "EntityCell"

    // MARK: - Properties

    var partners: [Partner] = []

    // MARK: - Methods

    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.register(UINib(nibName: ViewName.entityCell, bundle: nil), forCellReuseIdentifier: PartnersViewController.entityCell)

        self.navigationController?.navigationBar.prefersLargeTitles = true

        self.loadPartners()
    }

    func loadPartners() {
        URLCache.shared.removeAllCachedResponses()
        Alamofire.request("https://hackathon.setapp.pl/partners.json").responseJSON { response in
            if let data = response.data {
                let json = JSON(data: data)

                if let partners = json["data"].array {
                    for partnerObject in partners {
                        let partner = Partner(
                            name: partnerObject["name"].string!,
                            logoUrl: partnerObject["logo_url"].string!,
                            website: partnerObject["website"].string!
                        )

                        self.partners.append(partner)
                    }

                    self.tableView.reloadData()
                }
            }
        }
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PartnersViewController.entityCell) as? EntityCell else {
            fatalError()
        }

        let partner = self.partners[indexPath.row]

        cell.configure(with: partner)

        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let partner = self.partners[indexPath.row]

        let storyboard = UIStoryboard(name: StoryboardName.details, bundle: nil)

        if let viewController = storyboard.instantiateViewController(withIdentifier: ViewControllerName.presentation) as? PresentationViewController {
            viewController.viewModel = partner

            self.navigationController?.pushViewController(viewController, animated: true)
        }
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.partners.count
    }
}

