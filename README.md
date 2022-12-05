# Photo Roulette
<em>Aarthi Balaji, Runali Hatalkar, Shreya Vinjamuri, Yu Jun Yam</em>
<br><br>

### Summary
Many people have random pictures on their phones that could offer a sense of enjoyment and understanding if shown to those who are close to them or whom 
they are getting to know. Photo Roulette is a multiplayer iOS game where photos are selected from every participant's camera roll and are displayed on the
screen one at a time for the other users to guess whose camera roll the picture belongs to. This game is the perfect way for players to learn anything 
from one's lifestyle to their personality and could easily break the ice during friendly gatherings.

Some of the functionalities covered are as follows:
<ul>
  <li>Users can sign up/create an account and log in to the app.</li>
  <li>Users can start a game by creating a group session with a game pin.</li>
  <li>Users can access their camera roll directly from the app to choose a photo for the game.</li>
  <li>Users can see the photo displayed and select which player's photo they think it is.</li>
  <li>Users can see the winner of the game.</li>
</ul>
<br>

### Technical Architecture
**<em>Backend</em>** <br>
Since this is an iOS mobile application, the backend is written using Swift and Objective-C with Cocoa Pods as the dependency manager in the XCode IDE. Parse library is used in addition to that for easy, fast, and responsive data storage and management. Here are some responsibilities of backend:
<ul>
  <li>Stores a list of users and respective rooms they are in</li>
  <li>Enables create and join rooms</li>
  <li>Randomly display users' photos during the game</li>
  <li>Calculate the accuracy of each player in the game</li>
  <li>Determine the winner of the game</li>
 </ul>

**<em>Frontend</em>** <br>
We also work on the frontend in the XCode IDE using XCode storyboard and the builtin library UIKit. UI components are connected to their usage on the backend using the Cocoa Pods dependency manager.
![Technical Architecture Diagram](/assets/tech.png)
<br><br>

### Installation Instructions

<br><br>

### Group Members and Roles
Aarthi Balaji: Backend <br>
Runali Hatalkar: Frontend <br>
Shreya Vinjamuri: Backend <br>
Yu Jun Yam: Frontend
