# <h1> Bar-Roulette </h1>
 <p> PROG31975 Project - Akshay, Luke, Ammar </p>


<h1> APP INTRODUCTION </h1>

<p> Are you and your friends indecisive? Do you struggle to decide where to go out for drinks? Bar roulette is an app that let’s destiny decide where you’re going out tonight.  Our app randomly selects a location from a list of nearby bars for you.  Information about the bar is then displayed and you are then able to redirect to uber or google maps.  If you end up liking the location, you can add it to a list of favorites for later use! </p>

<p> The target audience for this app is anyone of legal drinking age but mostly people in their 20-30s as they tend to be a little more adventurous than the older crowd. Not to mention that this app is intended for alcohol drinkers alongside those who like to go out and be social. </p>

<p> The problem that bar roulette is attempting to solve is the issue of not being able to decide where to grab a drink. This idea is tackled through the use of random chance to tell the user of the application where their next round of drinks is to be served.  Not to mention the app also lets you mark down bars as favourites and keeps them ready and waiting in a list for you to view later.  Essentially bar roulette is a means to discover and save your favourite bar all in a simple and easy-to-use app for your iPhone. </p>


<p> For specifically getting a hold of the potential bars that will be shown to the user, we will make use of location services available to us within the iOS environment to source local pubs. When presenting the bar to the user we will make use of app clips to open the bar in other apps such as Apple Maps. Following all of this, the favourites functionality as mentioned before will be tackled using data persistence to keep the list the same throughout multiple sessions. </p>

<h1> WORK DISTRIBUTION </h1>

NOTE: Ammar has dropped the course. Luke and Akshay will be responsible for implementing his assigned workload.

<h2> Akshay will be responsible for: </h2>
<p> •	A favorites section of bars view using data persistence (Coredata), where users will have their saved bars on the page, so they don’t have to take time to search up the bar again. </p>
<p> •	A Widget that shows the nearest bar at all times based on current location. </p>

<h2> Luke will be responsible for: </h2>
<p> •	The UI and UX part of the app of “Bar Roulette.” It will be designed for a user-friendly experience, while being easy to navigate to different views and pages of the app. </p>
<p> •	The randomization selection of bars where it uses a list of bars and picks one bar at random whenever the user opens the app to go out drinking with their family and friends. </p>

<h2> Ammar will be responsible for: </h2>
<p> •	Fetching the list of bars. It will use location services to find nearby bars in the user’s location radius. </p>
<p> •	the interaction of views, which will be made sure to be user-friendly e.g., ease and speed of navigation through the app. </p>

<h1> WHAT WE ACCOMPLISHED: </h1>
<h2> Akshay: </h2>
<p> -Implemented CoreData functionality (create, retrieve, delete. Update is not necessary in this app. </p>
<p> -Implemented Persistence and CoreDBHelper to help with CoreData functionality </p>
<p> -Implemented bar class, needs more work based on landmark information </p>
<p> -Implemented LocationManager </p>
<p> -Implemented MapView functionality. We probably will not use the map but will definitely use LandMark retrieval functionality. Created LandMark Model. </p>
<p> -Implemented a widget that shows the closest bar to you. At this moment it does not seem to be functional. localBars in BarHelper seems to be empty everytime the app is run </p>
<p> -Helped with the debugging of obtaining bars in the main app</p>

<h2> Luke: </h2>
<p> -Implemented BarView, ContentView and Favourites View, fully finished but a little buggy. </p>
<p> -Implemented the ability to navigate between views, Not all are functional as they rely on a location passed to them. </p>
<p> -Implemented the UI modifiers that sefine the overall look of the application. </p>
<p> -Created custom artwork for the app icon and bar image placeholder in aseprite. </p>
<p> -Implemented the use of a custom app icon. </p>
<p> -Implemented location retrieval and searching. </p>
<p> -Implemented the ability to view the bar on apple maps through the press of a button </p>
<p> -Implemented the randomization of bars. </p>
<p> -Implemented interaction with the database. </p>
<p> -Fixed a bunch of bugs. </p>

