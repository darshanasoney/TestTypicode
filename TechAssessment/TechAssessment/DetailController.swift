//
//  DetailController.swift
//  TechAssessment
//
//  Created by Darshana on 26/04/24.
//

import Foundation
import UIKit

class DetailController : UIViewController {
    
    @IBOutlet weak var lblId: UILabel!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblBody: UILabel!
    
    var profile : Profile?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.populate()
    }
    
    func populate() {
        if let profile = profile {
            self.lblId.attributedText = "\(profile.id ?? 0)".setString(key: "ID: ")
            self.lblBody.attributedText = profile.body?.setString(key: "Body: ")
            self.lblTitle.attributedText = profile.title?.setString(key: "Title: ")
        }
    }
    
    @IBAction func backPressed(_ sender : UIButton) {
        self.dismiss(animated: true)
    }
    
}
