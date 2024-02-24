//
//  LandmarkRow.swift
//  Marks
//
//  Created by Sargerace on 2024/2/20.
//

import SwiftUI

struct LandmarkRow: View {
    var landmark: Landmark
    var body: some View {
           HStack {
               landmark.image
                               .resizable()
                               .frame(width: 50, height: 50)
                          
               Text(landmark.name)
               
               Spacer()
               
               
               if landmark.isFavorite {
                   Image(systemName: "star.fill")
                       .foregroundStyle(.yellow)

               }
           }
       }

}

#Preview{
    let landmarks = ModelData().landmarks
       return Group {
        LandmarkRow(landmark: landmarks[0])
        LandmarkRow(landmark: landmarks[1])
    }
}

//
//#Preview ("Salmon"){
//    LandmarkRow(landmark: landmarks[1])
//}
