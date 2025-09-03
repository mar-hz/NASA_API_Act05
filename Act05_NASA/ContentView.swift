//
//  ContentView.swift
//  Act05_NASA
//
//  Created by Alumno on 03/09/25.
//

import SwiftUI

struct ContentView: View {
    @State var photoVM = PhotoViewModel()
    
    var body: some View {
        VStack {
            List(photoVM.arrPhotos) { item in
                Text(item.title)
                AsyncImage(url: URL(string: item.url!))
                    .scaledToFit()
                    .frame(height: 100)
            }
            .task {
                do {
                    try await photoVM.getPhotosNasa()
                } catch {
                    print("Error getting pictures")
                }
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
