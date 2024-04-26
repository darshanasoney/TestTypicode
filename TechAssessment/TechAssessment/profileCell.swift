//
//  profileCell.swift
//  TechAssessment
//
//  Created by Darshana  on 26/04/24.
//

import UIKit

class profileCell: UITableViewCell {
    
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var lblId: UILabel!
    @IBOutlet weak var lblTitle: UILabel!
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    func populate(profile : Profile) {
        self.lblId.attributedText = "\(profile.id ?? 0)".setString(key: "Profile ID: ")
        self.lblTitle.attributedText = (profile.title ?? "").setString(key: "Title: ")
    }
}
