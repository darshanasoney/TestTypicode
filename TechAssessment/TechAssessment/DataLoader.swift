//
//  DataLoader.swift
//  TechAssessment
//
//  Created by Darshana  on 26/04/24.
//

import Foundation
import UIKit

class DataLoader {
    static let shared = DataLoader()
    private init() {}
    
    func getData(userId: Int, completionHandler : @escaping (([Profile], Error?) -> Void)) {
        
        let fullUrl = "\(apiURL)\(userId)"
        guard let url = URL(string: fullUrl) else {
            return
        }
            
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
            
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard error == nil else {
                DispatchQueue.main.async {
                    completionHandler([], error)
                }
                return
            }
            guard data != nil else {
                let error = NSError(domain: "No Record Found", code: 200, userInfo: nil)
                DispatchQueue.main.async {
                    completionHandler([], error)
                }
                return
            }
            
            
            do {
                if let decodedData = try JSONSerialization.jsonObject(with: data!, options: .fragmentsAllowed) as? [NSDictionary] {
                    let profiles = decodedData.map { obj in
                        let profile = Profile(profile: obj)
                        return profile
                    }
                    DispatchQueue.main.async {
                        completionHandler(profiles, nil)
                    }
                }
            } catch {
                DispatchQueue.main.async {
                    completionHandler([], error)
                }
            }
        }.resume()
    }
}
