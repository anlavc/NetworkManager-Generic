//
//  LocationView.swift
//  GenericNetworkManager
//
//  Created by Anıl AVCI on 31.05.2024.
//

import SwiftUI

struct LocationView: View {
    
    @ObservedObject var model: LocationViewModel
    
    var body: some View {
        ScrollView {
            VStack {
                VStack(alignment: .leading,spacing: 5) {
                    Text("Name: ") + Text(model.location?.name ?? "") .font(.title2) .foregroundStyle(.red)
                    Text("Type: ") + Text(model.location?.type ?? "")
                    Text("Dimension: ") + Text(model.location?.dimension ?? "")
                }
                Button(action: { model.onTapNavHome() }, label: {
                    HStack {
                        Text("Return to Home")
                        Image(systemName: "arrowshape.turn.up.backward.circle")
                    }
                    .font(.title2)
                    
                })
                .padding(.top,30)
            }
            .padding(.vertical, 30)
        }
        .onAppear(perform: {
            model.fetchLocationRequest(url: model.locationUrl)
        })
        .navigationBarItems(
            leading:  Image(systemName: "arrow.left.circle.fill").resizable().frame(width: 32, height: 32).onTapGesture {
                model.onTapNavPathBack()
            },
            trailing: Text("Location").font(.title3)
        )
    }
}

//#Preview {
//    LocationView(model: .)
//}
