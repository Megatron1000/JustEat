# JustEatMark Bridges Technical Questions
==================================

###  1. How long did you spend on the coding test? What would you add to your solution if you had more time? If you didn't spend much time on the coding test then use this as an opportunity to explain what you would add.

I spent approximately 4-5 hours on the test. If I had more time I would have included more unit tests. Unit testing mobile applications is not something every company looks for or actively undertakes so I was unsure if this was something that would be evaluated. I therefore chose to only TDD in a few quick win places, mostly concentrating on the model.

### 2. What was the most useful feature that was added to the latest version of your chosen language? Please include a snippet of code that shows how you've used it.

The most useful feature I think that was added to Objective-C in the last release was Swift; although technical it's not a feature of Objective-C itself, of course. Even though I don't feel it's mature enough for a large scale project yet it does open up many new patterns as well as provide some relief from its bracket obsessed, header filled counterpart.

For example it's considerably more please to write

```Swift
let name = "Mark" + "Bridges"
```

instead of

```Objective-C
NSString *name = [NSString stringWithFormat:@"%@ %@", @"Mark", @"Bridges"];
```


### 3. How would you track down a performance issue in an application? Have you ever had to do this?

When you want to optimize performance you need to use Instruments. The suite of tools has many ways of tracing what's going on inside your app, but for general performance you should use the Time Profiler. Using this you can run through a use case of your app and see how much CPU time parts of your app is taking up. You can drill down to find the methods that use the majority of the time and look to optimize these calls; usually by calling them less often, making them less complex or finding a more efficient alternative. I generally do this towards the end of a project and whenever something unreasonably takes a perceptable amount of time to complete.

### 4. How would you improve the JUST EAT APIs that you just used?

In the scenario I completed I used the internal iOS reverse geocoding to find my postcode as a string and then send that postcode to the API. It would be better if I could send my coordinates to the API instead, as the client's geocoding could be inconsistent across various platforms. (I'm sure you already do this)

The ratings going up to 6.0 is unexpected and would likely confuse many consumers of this API. Without reading the docs there's no real way to know what the max rating could be (I've just assumed it's 6 stars because the app shows six stars). It would make more sense if the rating was returned with a max of 1.0. It would then be much more agnostic, allowing the client display it in a suitable way without manipulation.

The results in this call aren't paginated. Performance could be improved.


### 5. Please describe yourself using JSON.

```json
{
  "name": {
    "firstName": "Mark",
    "surname": "Bridges"
  },
  "physical": {
    "male": true,
    "height": 180,
    "heightUnit": "CM",
    "weight": 84,
    "weightUnit": "KG"
  },
  "Interests": [
    {
      "name": "Computers",
      "rank": 1
    },
    {
      "name": "Ping Pong",
      "rank": 2
    },
    {
      "name": "Pub",
      "rank": 3
    }
  ]
}
```
