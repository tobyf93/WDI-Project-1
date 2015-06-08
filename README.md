#Project Description
The 'original' DeadDrops concept originated in New York (2010) by a Berlin-based artist by the name of Aram Bartholl.  It involved planting USB's in public locations using fast-setting concrete.  For more info on the original idea see http://en.wikipedia.org/wiki/USB_dead_drop.

Using HTML5 geolocation technologies i decided to recreate DeadDrops as a cloud-based service.  Users can visit a location and view media files (that are within a 100m radius) that other users have dropped as well as publishing their own.  Each media item is pinned on a heatmap using a precise latitude/longitude.  

##Development Stack
* Front-End
 * HTML5
 * CSS3 / Sass Preprocessor
 * JavaScript / jQuery Framework
* Back-End
 * Ruby 2.2.2p95
 * Rails 4.2.1
 * PostgreSQL 9.4.2

##App Setup
Clone the DeadDrops repository

`git clone https://github.com/tobyf93/WDI-Project-1.git`


Install application gems and dependencies

`bundle`


Create PostgreSQL database and execute migrations

`rake db:create`
`rake db:migrate`


(optional) Update database with seed data

`rake db:seed`
