//
//  LandmarkList.swift
//  Marks
//
//  Created by Sargerace on 2024/2/20.
//

import SwiftUI

struct LandmarkList: View {
    @Environment(ModelData.self) var modelData

    @State private var showFavoritesOnly = false
    
    var filteredLandmarks: [Landmark] {
        modelData.landmarks.filter { landmark in
               (!showFavoritesOnly || landmark.isFavorite)
           }
       }

    
    var body: some View {
        NavigationSplitView {
            
            //        List(landmarks, id: \.id) { landmark in
//            List(landmarks) { landmark in
//            List(filteredLandmarks) { landmark in
            List {
                Toggle(isOn: $showFavoritesOnly) {
                                   Text("Favorites only")
                               }

                ForEach(filteredLandmarks) { landmark in
                    
                    
                    NavigationLink {
                        LandmarkDetail(landmark: landmark)
                    } label: {
                        LandmarkRow(landmark: landmark)
                    }
                }
                //        List {
                //                  LandmarkRow(landmark: landmarks[0])
                //                  LandmarkRow(landmark: landmarks[1])
                //              }
            }        
            .navigationTitle("Landmarks")

        }detail: {
            Text("Select a Landmark")
        }
    }
}

#Preview {
    LandmarkList()
        .environment(ModelData())

}
