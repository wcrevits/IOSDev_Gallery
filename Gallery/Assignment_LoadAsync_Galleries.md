# Assignment: Asynchronous Data Loading in Galleries App

**Course:** iOS Development  
**Program:** Bachelor Applied Computer Science  
**Topic:** Async/Await and Data Loading with SwiftUI  
**Instructors:** Milan Dima, Dirk Hostens

---

Starter Files in [the Assignment_LoadAsync_Galleries_files directory](./Assignment_LoadAsync_Galleries_files/)

## 📋 Introduction

In this assignment you will combine Tab navigation and navigation using a NavigationStack with Path. The data will be loaded using a **asynchronous data loading** in SwiftUI.
The app start with 2 tabs: a list of galleries and a detail of the selected gallery. If no gallery is selected in the list of galleries, the text "Selzct a gallery" is shown. In the Gallery detail view, you can navigate to one of the artists of the gallery. In the artist detail view you can navigate to the list of art of the artist. In the art detail view you can navigate to the artists or to other arts.

### Functionality of the Galleries App

The Galleries app offers the following functionalities:

- **List of galleries**: Galleries are loaded asynchronously and displayed in a list with name, location and description
- **Gallery details**: Select a gallery to view its artists and details
- **Artist view**: Navigate to an artist to see their biography and artworks
- **Artwork view**: Navigate to an artwork to see detailed information including year, medium and dimensions. You get also a list of other artworks.
- **Navigation**: Deep navigation through galleries → artists → artworks

## 📱 Screenshots

![Galleries Screenshot 0](images/Galleries%20-%20screenshot%200.png)
![Galleries Screenshot 1](images/Galleries%20-%20screenshot%201.png)
![Galleries Screenshot 2](images/Galleries%20-%20screenshot%202.png)
![Galleries Screenshot 3](images/Galleries%20-%20screenshot%203.png)
![Galleries Screenshot 4](images/Galleries%20-%20screenshot%204.png)

---

## 🎯 Learning Objectives

After this assignment you will be able to:

- ✅ Explain how async/await works in Swift
- ✅ Implement asynchronous functions in a DataStore class
- ✅ Add a loading state to your SwiftUI views
- ✅ Use the `.task` modifier for async operations
- ✅ Load JSON data and map it to model objects

---

## 📚 Background: The GalleryData Class

### Overview of the GalleryData

The `GalleryData` class is an **Observable** data model that acts as the data source for gallery information. We add a load function to implemnt asynchronous loading.

### Your Task: Implementing loadData()

You need to add the `GalleryData` class to load data asynchronously. Here's what you should implement:

```swift
@Observable
class GalleryData {

    //...

    func loadData() async {
        // TODO: Implement async loading
        do {
            print("⏳ Simulating 2-second load delay...")
            try await Task.sleep(for: .seconds(2)) // Simulate long load
            //load galleries here
            print("✅ Data loaded successfully.")
        } catch {
            print("❌ Failed to load galleries:", error)
            galleries = []
        }
    }
}
```

---

#### 4️⃣ AppData Class

Since most of the information (path, galleries, ...) is needed on the different screens, we will create an AppDate class and add is an Environment object.

The `AppData` class :

- Access galleries, srtists and artworks through the `GalleryData` instance
- Has a reference to the path variable used for the navigation

---

## 🏗️ Architecture

The Galleries app follows the MVVM pattern:

- **Models**: `Gallery`, `Artist`, `Artwork`, `Galleries` (JSON wrapper)
- **DataStore**: `GalleryData` (loads and stores gallery data)
- **ViewModels**: `AppData` (manages app state, selected gallery, navigation)
- **Views**: `GalleriesView`, `GalleryDetailView`, `ArtistView`, `ArtworkView`

### Data Flow

1. `GalleriesView` triggers `loadData()` via `.task` modifier
2. `GalleryData.loadData()` asynchronously loads JSON
3. `galleries` array is populated
4. SwiftUI automatically updates the UI through `@Observable`
5. User can select gallery → view artists → view artworks

## 📖 Useful Resources

- [Swift Concurrency Documentation](https://docs.swift.org/swift-book/LanguageGuide/Concurrency.html)
- [SwiftUI Task Modifier](<https://developer.apple.com/documentation/swiftui/view/task(priority:_:)>)
- [Observable Macro](<https://developer.apple.com/documentation/observation/observable()>)
- [ProgressView Documentation](https://developer.apple.com/documentation/swiftui/progressview)

---

## ✅ Expected Results

After completing this assignment:

1. ✅ App shows loading indicator when launched
2. ✅ Galleries load after simulated network delay
3. ✅ Console shows loading messages
4. ✅ All navigation functionality remains working
5. ✅ Error handling catches and logs failures
6. ✅ UI remains responsive during loading

---

**Good luck! 🎉**
