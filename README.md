# README
README

The purpose of this application is to provide insights into the spread of violence throughout the world.

This README informs on how to install this application locally. An online version can be found at https://www.awd2.herokuapp.com

Follow the following steps (it is expected that a UNIX-based OS is used and at least Ruby 2.4.1 and Ruby on Rails 5.2.1 & PostgreSQL are installed):

    Download and extract the .zip file and navigate to the root folder in Terminal.

    run "bundle install" to install all gems and dependencies from the Gemfile (run "gem install bundler" if not installed)

    Open /config/database.yml and change username & password to your local data- base details (for test, development & production)

    run "rake db:migrate" to create the tables

    run "rake battles:seed_battles" to seed the tables with data from the CSV files

    run "rails s" to start the local server

    Open a browser window and navigate to "localhost:3000" to view & start using the application. Even though this runs the application locally, make sure you are connected to the internet so that the application can receive data e.g. from the Bootstrap CDN or from Google Maps API

    For any questions m.lilchev.17@aberdeen.ac.uk

The different accessible routes on the application are: / /pinmap/index/ /datatable/index/ /heatmap/index /pinmap/:id Obtaining JSON: /api/country /api/conflict /api/clash 
