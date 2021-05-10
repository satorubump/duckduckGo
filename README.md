# duckduckGo

![CharactersList](images/charactersList.png "CharactersList")

![SimpsonsPortrait](images/simpsonsPortrait.png "SimpsonsPortlait")

![TheWireiPhone](images/theWireiPhone.png "TheWireiPhone")

![SimpsonsLandscape](images/simpsonsLandscape.png "SimpsonsLandscape")

![TheWireiPad](images/theWireiPad.png "TheWireiPad")

![SimpsonsiPad](images/simpsonsiPad.png "SimpsonsiPad")


## Implementation
- Design is an MVVM Model with SwiftUI and Combine, etc.
- Connect to API:
http://api.duckduckgo.com/?q=simpsons+characters&format=json
http://api.duckduckgo.com/?q=the+wire+characters&format=json
- Using SwiftUI for user interface and the update backend data with observed object.
- The multiple applications from a shared codebase
Simpsons Characters Viewer
The Wire Characters VIewer

### View
- <b>CharactersListView.swift</b> - 
Characters Name List
- <b>CharacterDetailsView.swift</b> - 
Character Details View 
- <b>URLImage.swift</b> - 
UI Component for display and download Images from URL with Asynchronous

### ViewModel
- <b>CharactersListViewModel.swift</b> -
View Model for CharactersListView. This is connect and update the download data from API 
- <b>OrientationInfo.swift</b> -
Objservable View Model for the device orientation.
- <b>ImageDownloader.swift</b> -
Download and Update the image data to URLImage 

### Model
- <b>CharactersAPIResponse.swift</b> -
Characters Data Model from API

### Characters API Fetcher
- <b>CharactersAPI.swift</b> -
Connect to API and Fetch data with Combine publisher

### Helpers
- <b>ExtensionString.swift</b> -
String extension for the parsing characters data
- <b>Constants.swift</b> -
Define constants table

