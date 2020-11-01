#  Demonstrates Navigation Issues in iOS14

This is a cut down version of my App that demonstrates navigation issues in iOS14 when using NavigationLink with tags, and @Published properties in ObservedObjects

This was not a problem in iOS13

Steps:
1. Run App
2. Press button "Show Detail Screen One" in the HomeView
3. Detail Screen One is pushed onto the stack (is a green screen)
4. Push button "Show Detail Screen Two"
5. Detail Screen Two is pushed onto the stack (is an orange screen)
6. An image is download as soon as the Orange Detail Screen Two is pushed
7. When this image is downloaded and published to the rest of the App then things go wrong:
   - The whole View Heirachy is rebuilt, the propery in HomeView which controls which NavigationLink is displayed is set to nil and the navigation stack pops back to root.
8. This did not happen in iOS13

Now I can stop this issue happening if I remove the DownloadManager in HomeView, but it my real App I need this.
I can change how downloadManager works, but I also see this problem with my GlobalUISettings and all other EnvironmentObject that use Published properties in my real App.

This is blocking me pushing out a new version of the App.

