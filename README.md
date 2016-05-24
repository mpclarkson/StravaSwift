# StravaSwift

[![CI Status](http://img.shields.io/travis/mpclarkson/StravaSwift.svg?style=flat)](https://travis-ci.org/mpclarkson/StravaSwift)
[![Version](https://img.shields.io/cocoapods/v/StravaSwift.svg?style=flat)](http://cocoapods.org/pods/StravaSwift)
[![License](https://img.shields.io/cocoapods/l/StravaSwift.svg?style=flat)](http://cocoapods.org/pods/StravaSwift)
[![Platform](https://img.shields.io/cocoapods/p/StravaSwift.svg?style=flat)](http://cocoapods.org/pods/StravaSwift)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Installation

StravaSwift is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "StravaSwift"
```

## Quick Start

* First, you must [register your app](http://labs.strava.com/developers/) with Strava and get an oAuth `client id` and `client secret`.

* Now, create a custom object that implements the `TokenDelegate` protocol, which is responsible for saving and retrieving the oAuth token. Here is an example to get you started:

```swift
struct TokenHandler: TokenDelegate {

    //You'd probably want to save the token somewhere (e.g. NSUserDefaults)
    private var token: OAuthToken?

    func get() -> OAuthToken? {
        return token
    }

    mutating func set(token: OAuthToken?) {
        self.token = token
    }
}
```

* Initialize the Strava Client as follows, preferably in your `AppDelegate.swift` to ensure it is configured before you call it:

```swift
  let config = StravaConfig(
    clientId: YourStravaClientId,
    clientSecret: YourStravaClientSecret,
    redirectUri: YourRedirectUrl, //Don't forget to register this scheme in your info.plist
    delegate: TokenHandler()  //i.e. your custom object that implements the TokenDelegate protocol (see above)
)

StravaClient.sharedInstance.initWithConfig(config)
```

* Register your redirect URL scheme in your info.plist.

* Implement the following method in your `AppDelegate.swift` to handle the oAuth redirection from Strava:

```swift
    func application(application: UIApplication, openURL url: NSURL, sourceApplication: String?, annotation: AnyObject) -> Bool {
        guard let code = strava?.handleAuthorizationRedirect(url) else { return false }
        //Exchange the code for a token
        strava.getAccessToken(code) { token in
            //Do something if you want, but the token is already available to the
            //StravaClient thanks to the TokenDelegate
        }
        return true
    }
```

* Now you can start requesting resources, for example:

```swift

let strava = StravaClient.sharedInstance

strava.request(Router.Athlete) { [weak self] (athlete: Athlete?) in
    guard let `self` = self, athlete = athlete else { return }
    //do something with the athlete
}

strava.request(Router.AthleteActivities(params)) { [weak self] (activities: [Activity]?) in
    guard let `self` = self, activities = activities else { return }
   //do something with the activities
}
```

## Author

Matthew Clarkson, mpclarkson@gmail.com

## License

StravaSwift is available under the MIT license. See the LICENSE file for more info.
