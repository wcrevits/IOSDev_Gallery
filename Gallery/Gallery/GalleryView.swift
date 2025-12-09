//
//  GalleryView.swift
//  
//
//  Created by Wout Crevits on 09/12/2025.
//

import SwiftUI

struct GalleryView: View {
    @Binding var selectedGallery: Gallery?
    @State var selectedArtist: Artist?
    @Environment(PathStore.self) var pathStore
    var body: some View {
        @Bindable var path = pathStore
        if let selectedGallery = selectedGallery{
            NavigationStack(path: $path.path){
                VStack{
                    VStack(alignment: .center){
                        Text(selectedGallery.name).foregroundStyle(.brown).bold(true).font(Font.largeTitle)
                    }
                    Divider().foregroundStyle(Color.brown)
                    VStack(alignment: .center){
                        Text(selectedGallery.location)
                        Text(selectedGallery.description)
                    }
                    Divider().foregroundStyle(Color.brown)
                    VStack(alignment: .center) {
                        Text("List of artists").foregroundStyle(Color.brown)
                        List(selectedGallery.artists, id: \.self, selection: $selectedArtist){ artist in
                            NavigationLink(value: Route.artist(artist)){
                                VStack{
                                    Text(artist.name).foregroundStyle(Color.brown).bold(true)
                                    Text(artist.nationality).foregroundStyle(Color.gray)
                                }
                            }
                        }
                    }
                }.navigationDestination(for: Route.self) { route in
                    switch route{
                    case let .artist(artist):
                        ArtistView(artist: artist)
                    case let .artwork(artwork):
                        ArtworkView(art: artwork)
                    }
                }
            }
        }else{
            Text("No gallery selected")
        }
    }
}

