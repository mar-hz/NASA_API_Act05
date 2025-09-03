//
//  PhotoViewModel.swift
//  Act05_NASA
//
//  Created by Alumno on 03/09/25.
//

import Foundation

@Observable
class PhotoViewModel : ObservableObject {
    var arrPhotos = [Photo]()
    
    func getPhotosNasa() async throws {
        guard let url = URL(string: "https://api.nasa.gov/planetary/apod?api_key=ND4Q34Zdd7Fsk3nQdLW8y8P2Fj1Z4Ri3UsaGZIWt&count=10") else {
            print("Invalid URL")
            return
        }
        
        let urlRequest = URLRequest(url: url)
        
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        
        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
            print("Request error")
            return
        }
        
        let results = try JSONDecoder().decode([Photo].self, from: data)
        print(results)
        
        DispatchQueue.main.async {
            self.arrPhotos = results
        }
    }
}
