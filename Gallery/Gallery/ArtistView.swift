//
//  ArtistView.swift
//  
//
//  Created by Wout Crevits on 09/12/2025.
//

import SwiftUI

struct ArtistView: View {
    @State var artist: Artist
    @State var selectedArt: Artwork?
    var body: some View {
        VStack {
            VStack {
                Text(artist.name).foregroundStyle(.brown).bold(true).font(Font.largeTitle)
            }
            Divider().foregroundStyle(Color.brown).bold(true)
            
            VStack {
                Text(artist.nationality)
                Text(artist.style)
                Text(artist.description).foregroundStyle(.gray)
            }
            Divider().foregroundStyle(Color.brown)
            
            VStack {
                Text("List of art").foregroundStyle(.brown)
                List(artist.artworks, id: \.self, selection: $selectedArt) {
                    art in
                    NavigationLink(value: Route.artwork(art)) {
                        VStack {
                            Text(art.title).foregroundStyle(.brown).bold(true)
                            Text(art.description).foregroundStyle(.gray).lineLimit(1)
                        }
                    }
                }
            }
        }
    }
}
