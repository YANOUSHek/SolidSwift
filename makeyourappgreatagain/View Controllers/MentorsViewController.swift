//
//  SecondViewController.swift
//  makeyourappgreatagain
//
//  Created by Aleksander Lorenc on 20/09/2017.
//

import UIKit
import Alamofire
import SwiftyJSON

class MentorsViewController: UITableViewController {

    static let entityCell = "EntityCell"

    // MARK: - Properties

    var mentors: [Mentor] = []

    // MARK: - Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.register(UINib(nibName: ViewName.entityCell, bundle: nil), forCellReuseIdentifier: MentorsViewController.entityCell)

        self.navigationController?.navigationBar.prefersLargeTitles = true

        self.loadMentors()
    }

    func loadMentors() {
        Alamofire.request("https://hackathon.setapp.pl/mentors.json").responseJSON { response in
            if let data = response.data {
                let json = JSON(data: data)

                let mentors = json["data"].array!

                for mentorObject in mentors {
                    let mentor = Mentor(
                        name: mentorObject["name"].string!,
                        description: mentorObject["description"].string!,
                        photoUrl: mentorObject["photo_url"].string!
                    )

                    self.mentors.append(mentor)
                }

                self.tableView.reloadData()
            }
        }
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MentorsViewController.entityCell) as? EntityCell else {
            fatalError()
        }

        let mentor = self.mentors[indexPath.row]

        cell.configure(with: mentor)

        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let mentor = self.mentors[indexPath.row]

        let storyboard = UIStoryboard(name: StoryboardName.details, bundle: nil)

        if let viewController = storyboard.instantiateViewController(withIdentifier: ViewControllerName.presentation) as? PresentationViewController {
            viewController.viewModel = mentor

            self.navigationController?.pushViewController(viewController, animated: true)
        }
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.mentors.count
    }
}
