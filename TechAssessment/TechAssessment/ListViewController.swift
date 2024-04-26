//
//  ListViewController.swift
//  TechAssessment
//
//  Created by Darshana  on 26/04/24.
//

import UIKit

class ListViewController: UIViewController {
    
    @IBOutlet weak var profileTable: UITableView!
    
    
    let effectView = UIVisualEffectView(effect: UIBlurEffect(style: .regular))
    
    let clock = ContinuousClock()
    var profiles : [Profile] = []
    var userId = 1
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let timeAmount = clock.measure(RenderProfile)

        print(" Time taken to load initial Data \(timeAmount)")
    }
    
    func setData() {
        
        profileTable.register(UINib(nibName: "profileCell", bundle: nil), forCellReuseIdentifier: "profileCell")
        profileTable.dataSource = self
        profileTable.delegate = self
    }
    
    func RenderProfile() {
        self.activityIndicator(effectView: effectView)
        DataLoader.shared.getData(userId: self.userId) { profiles,error in
            self.effectView.removeFromSuperview()
            if profiles.count > 0 {
                self.setData()
                self.profiles.append(contentsOf: profiles)
                
                
                self.profileTable.reloadData()
            } else {
                var message : String?
                if error == nil {
                    message = "Fetched All Data"
                } else {
                    message = error?.localizedDescription
                }
                let vc = UIAlertController(title: "App", message: message , preferredStyle: .alert)
                vc.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: { action in
                    
                }))
                self.present(vc, animated: true)
            }
        }
    }
    
    
}

extension ListViewController : UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return profiles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "profileCell", for: indexPath) as? profileCell {
        
            cell.populate(profile: profiles[indexPath.row])
            
            if indexPath.row == profiles.count - 1 {
                self.userId = self.userId + 1
                let timeAmount = clock.measure(RenderProfile)
                print(" Time taken to load more Data \(timeAmount)")

            }
            
            return cell

        }
        return UITableViewCell()
    }
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = self.storyboard?.instantiateViewController(withIdentifier: "DetailController") as? DetailController {
            vc.profile = profiles[indexPath.row]
            
            vc.modalTransitionStyle = .coverVertical
            vc.modalPresentationStyle = .fullScreen
            
            self.present(vc, animated: true)
        }
    }
}
