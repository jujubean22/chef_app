# Cuisinero (*Chef Booking App*)

![logo](https://github.com/jujubean22/chef_app/blob/main/app/assets/images/logo/logo.png?raw=true )

A platform especially made for chefs who seek to promote their own culinary services and earn additional income

### What problem are we trying to address?

A lot of chefs were left jobless after the COVID-19 pandemic forced restaurants to close their stores. Although some found a way to earn income by offering themselves as private chefs, there is still a disconnect between them and their other potential clients as they use varied platforms (e.g. *Instagram, Facebook*) to advertise. Moreover, it may also be hard for clients to find available chefs within their vicinity.

### How can *Cuisinero* help?

As an app developed solely for booking chefs, *Cuisinero* offers a more consolidated platform for both chefs and clients to mix-and-match. Chefs can showcase their specialties, build their reputation, and be hired. Meanwhile, clients can easily search for available chefs based on their region of residence, browse their profiles, and book their desired chef.

## Key Features

### As Chef, you can:

* make your own profile and build your branding
* showcase your cuisines by uploading photos to your gallery
* confirm client appointments through the click of a button
* view your clients' request details and notes
* report a client with bad behavior

### As Client, you can:

* search for available chefs within your desired region
* view a chef's profile, the services offered, gallery, and reviews
* book your desired chef by sending a detailed request of the cuisine
* give review and rate the chef after your appointment

### As Admin, you can:

* view the list of users and their details
* suspend chefs with less than a 3-star rating or reported clients
* see the list of appointments made
* release the payment of the client to the chef after their appointment
* earn a 20% incentive per transaction in your own wallet

## TheMealDB API Wrapper

[TheMealDB](https://www.themealdb.com/) is an open, crowd-sourced database of Recipes from around the world.
We also offer a free JSON API for anyone wanting to use it, with additional features for subscribers.

### Endpoint

`GET` /random.php

Access via `https://cuisinero-booking.herokuapp.com/food/recipe/`
