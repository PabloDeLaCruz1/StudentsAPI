//
//  DataAPI.swift
//  MyStudents
//
//  Created by Pablo De La Cruz on 7/19/22.
//

import Foundation

struct DataAPI {
    //escaping to make the closure escape, since swift makes them nonescaping by default
    //because the closure passed as completion handler is executed once the request completes, which is some time after the data task is created. Meaning the closure will outlive the func scope.
    //Async process, meaning it will run in the background thread
    func getData(comp: @escaping ([Student]) -> ()) {
        guard let apiUrl = URL(string: "https://mocki.io/v1/abb92e67-c508-4b16-bdb2-0573b53cd364") else { return }

        URLSession.shared.dataTask(with: apiUrl) { data, response, error in
            guard let data = data else {
                print(error?.localizedDescription as Any)
                return
            }
            do {
                let result = try JSONDecoder().decode([Student].self, from: data)
                
                //Rows of students should be sorted by age
                //Pass sorted results to completion handler:
                comp(result.sorted { $0.studentAge < $1.studentAge })
            } catch {
                //Print out proper errors for easy debugging:
                print("errors trying to decode", error)
            }
        }.resume()
    }
    
}
