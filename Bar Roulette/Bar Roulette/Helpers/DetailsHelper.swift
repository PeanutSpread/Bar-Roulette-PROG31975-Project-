//
//  DetailsHelper.swift
//  Bar Roulette
//
//  Created by Luke Van Rooyen on 2021-12-11.
//
// Akshay Kochhar
// ID: 991414503
// Luke Van Rooyen
// ID: 991583099
// API KEY Dq1WJrfSAN3boRFSIkK36o_r2tEum8KbjKHs7Xd4H_Wzf8OMFRxCG8m0hdgPIvUd52HPpW3az1B2sOrtUgNggjLXT0T2ydOqI8dxA9_bvJtwGcB-PCQKeTNuiZu2YXYx
// Client ID KbHFInGDo1slhrwOZ5Hguw
import Foundation
import SwiftUI

class DetailsHelper : ObservableObject{
    @Published var detailsList = [Details]()
    var apiKey = "Dq1WJrfSAN3boRFSIkK36o_r2tEum8KbjKHs7Xd4H_Wzf8OMFRxCG8m0hdgPIvUd52HPpW3az1B2sOrtUgNggjLXT0T2ydOqI8dxA9_bvJtwGcB-PCQKeTNuiZu2YXYx"
    
    func clearDetailsList() {
        detailsList.removeAll()
    }
     
    func fetchData(latitude lat: Double, longitude lon: Double) {
        let url = URL(string: "https://api.yelp.com/v3/businesses/search?latitude=\(lat)&longitude=\(lon)&term=bar")
        var request = URLRequest(url: url!)
        request.setValue("Bearer \(apiKey)", forHTTPHeaderField: "Authorization")
        request.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let err = error {
                print(err.localizedDescription)
            }
            do {
                let json = try JSONSerialization.jsonObject(with: data!, options: []) as! [String: Any]
                print(">>>>>", json, #line, "<<<<<<<<<")
                let jsonData = data!
                let decoder = JSONDecoder()
                self.detailsList.append(try decoder.decode(Details.self, from: jsonData))
            } catch {
                print(#function, error)
            }
        }.resume()
        
    }
    
    private func fetchImage(from url: URL, withCompletion completion: @escaping (Data?) -> Void){
        
        let task = URLSession.shared.dataTask(with: url, completionHandler: { (data: Data?, response: URLResponse?, error: Error?) -> Void in
            
            if (data != nil){
                DispatchQueue.main.async {
                    completion(data)
                }
            }
        })
        
        task.resume()
        
    }
    
}
