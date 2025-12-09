//
//  ArtworkView.swift
//  
//
//  Created by Wout Crevits on 09/12/2025.
//

import SwiftUI

struct ArtworkView: View {
    @State var art: Artwork
    @Environment(GalleryStore.self) var galleryStore
    @State var selectedArt: Artwork?
    var body: some View {
        VStack{
            VStack{
                Text(art.title).foregroundStyle(.brown).bold(true).font(.largeTitle)
            }
            Divider().foregroundStyle(Color.brown).bold(true)
            VStack{
                Text(art.medium)
                Text(art.dimensions)
                Text(art.description).foregroundStyle(.gray)
            }
            Divider().foregroundStyle(Color.brown)
            VStack{
                Text("Artist: " + galleryStore.getArtistByArtwork(art:art)!.name).foregroundStyle(.brown)
            }
            Divider().foregroundStyle(Color.brown)
            VStack{
                Text("List of other art").foregroundStyle(.brown)
                List(galleryStore.getOtherArts(art: art), id: \.self, selection: $selectedArt){ art in
                    NavigationLink(value: Route.artwork(art)) {
                        VStack{
                            Text(art.title).foregroundStyle(Color.brown).bold(true)
                            Text(art.description).foregroundStyle(.gray).lineLimit(1)
                        }
                    }
                    
                }
            }
        }
    }
}
