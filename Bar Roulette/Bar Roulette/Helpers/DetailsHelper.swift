//
//  DetailsHelper.swift
//  Bar Roulette
//
//  Created by Luke Van Rooyen on 2021-12-11.
//

// API KEY 04b9ff136cb3428caf4da0600dfd534a
/* EXAMPLE https://api.geoapify.com/v2/place-details?apiKey=04b9ff136cb3428caf4da0600dfd534a&lat=43.470734&lon=-79.694534 */
import Foundation
import SwiftUI

class DetailsHelper : ObservableObject{
    @Published var DetailsList = [Details]()
    @Published var image = UIImage()
    var baseApiURL = "https://api.geoapify.com/v2/place-details?apiKey=04b9ff136cb3428caf4da0600dfd534a"
     
    func fetchData(latitude lat: Double, longitude lon: Double) {
        let end = "&lat=" + String(lat) + "&lon=" + String(lon)
        let apiURL = baseApiURL + end
        print(apiURL)
        guard let api = URL(string: apiURL) else {
            print(#function, "Unable to obtain URL from String")
            return
        }
        
        URLSession.shared.dataTask(with: api) {(data: Data?, response: URLResponse?, error: Error?) in
            
            if let error = error {
                print(#function, error)
            }else{
                
                if let httpResponse = response as? HTTPURLResponse{
                    if httpResponse.statusCode == 200{
                        
                        DispatchQueue.global().async {
                            do{
                                if (data != nil){
                                    
                                    if let jsonData = data{
                                        
                                        //indicates that you are expecting a single JSON object from API
                                        let decodedDetails = try! JSONDecoder().decode(Details.self, from: jsonData)
                                        
                                        guard data != nil else{
                                            print(#function, "Image data not obtained")
                                            return
                                        }
                                    
                                                
                                        DispatchQueue.main.async {
                                            if (self.DetailsList.isEmpty) {
                                                    self.DetailsList.append(decodedDetails)
                                                } else {
                                                    self.DetailsList[0] = decodedDetails
                                                }
                                                    
                                                    /*let test = self.reportList[0].location.country
                                                    print("\n" + test + " here \n")*/
                                                }
                                            }
                                }
                                
                            }
                        }
                    }else{
                        print(#function, "No response obtained from network call")
                    }
                }
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
