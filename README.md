# AFAboutViewController

[![CI Status](http://img.shields.io/travis/vpnss1231@gmail.com/AFAboutViewController.svg?style=flat)](https://travis-ci.org/vpnss1231@gmail.com/AFAboutViewController)
[![Version](https://img.shields.io/cocoapods/v/AFAboutViewController.svg?style=flat)](http://cocoapods.org/pods/AFAboutViewController)
[![License](https://img.shields.io/cocoapods/l/AFAboutViewController.svg?style=flat)](http://cocoapods.org/pods/AFAboutViewController)
[![Platform](https://img.shields.io/cocoapods/p/AFAboutViewController.svg?style=flat)](http://cocoapods.org/pods/AFAboutViewController)

![](https://raw.githubusercontent.com/hw-1/AFAboutViewController/master/Example/Screen1.png)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

AFAboutViewController is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "AFAboutViewController"
```

## how to use?
```ruby
@import AFAboutViewController;
//...
AFAboutViewController * about = [[AFAboutViewController alloc] initWithAppId:@"123456789"];
UINavigationController * nav = [[UINavigationController alloc] initWithRootViewController:about];
[self presentViewController:nav animated:YES completion:nil];
```

## Author

user1, user1@users.noreply.github.com

## License

AFAboutViewController is available under the MIT license. See the LICENSE file for more info.
