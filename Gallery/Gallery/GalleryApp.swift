//
//  App.swift
//  
//
//  Created by Wout Crevits on 09/12/2025.
//

import SwiftUI

@main
struct GalleryApp: App {
    @State var galleryStore = GalleryStore()
    @State var pathStore = PathStore()
    var body: some Scene {
        WindowGroup {
            ContentView().environment(galleryStore).environment(pathStore)
        }
    }
}
