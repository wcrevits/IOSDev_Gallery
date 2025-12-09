//
//  GalleryStore.swift
//  Gallery
//
//  Created by Wout Crevits on 09/12/2025.
//

import Foundation

@Observable
class GalleryStore{
    private var galleries = Galleries()
    
    
    func getGallery() -> [Gallery] {
        return galleries.galleries
    }
    
    func getArtistByArtwork(art:Artwork) -> Artist?{
        for gallery in galleries.galleries{
            for artist in gallery.artists{
                for artistWork in artist.artworks{
                    if artistWork == art{
                        return artist
                    }
                }
            }
        }
        return nil
    }
    
    
    func getGalleryByArt(art:Artwork) -> Gallery?{
        for gallery in galleries.galleries{
            for artist in gallery.artists{
                for artistWork in artist.artworks{
                    if artistWork == art{
                        return gallery
                    }
                }
            }
        }
        return nil
    }
    
    
    
    func getOtherArts(art:Artwork) -> [Artwork]{
        var arts: [Artwork] = []
        for gallery in getGalleryByArt(art: art)!.artists{
                for artistWork in gallery.artworks{
                    if artistWork != art{
                        arts.append(artistWork)
                    }
                }
        }
        return arts;
    }
    
    
    func loadData() async {
        //simulate async call
        do {
            print("⏳ Simulating 2-second load delay...")
            try await Task.sleep(for: .seconds(2)) // Simulate long load
            let data : Galleries = load("galleries.json")
            galleries.galleries = data.galleries
            print("✅ Data loaded successfully.")
            
        } catch {
            print("❌ Failed to load uurrooster:", error)
            //movies is lege array
        }
    }
}
