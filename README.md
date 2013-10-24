CoffeeMaker
===========

CoffeeMaker is a lightweight service which returns sample data in JSON from Twitter, Facebook, Foursquare and Instagram

Twitter
-------
Search tweets using any parameter defined in the [official documentation](https://dev.twitter.com/docs/api/1.1/get/search/tweets):
```
http://coffeemaker.herokuapp.com/twitter.json?q=cappuccino
```

Facebook
--------
Use the Graph API to search posts, people, pages, etc [Check the reference here](http://developers.facebook.com/docs/graph-api/):
```
http://coffeemaker.herokuapp.com/facebook.json?q=espresso
```

Foursquare
----------
Search for venues near a location using the parameters defined in the [documentation page](https://developer.foursquare.com/docs/venues/search):
```
http://coffeemaker.herokuapp.com/foursquare.json?q[near]=Lima, PE&q[query]=Cafe
```

Instagram
---------
Search for media near a location or recently tagged. By default, return the popular media:
```
http://coffeemaker.herokuapp.com/instagram.json?q=latte
```