# PartiallyEditField
[![Build Status](https://travis-ci.org/isamankumara/PartiallyEditField.svg?branch=master)](https://travis-ci.org/isamankumara/PartiallyEditField)
[![Version](https://img.shields.io/cocoapods/v/PartiallyEditField.svg?style=flat)](http://cocoapods.org/pods/PartiallyEditField)
[![License](https://img.shields.io/cocoapods/l/PartiallyEditField.svg?style=flat)](http://cocoapods.org/pods/PartiallyEditField)
[![Platform](https://img.shields.io/cocoapods/p/PartiallyEditField.svg?style=flat)](http://cocoapods.org/pods/PartiallyEditField)
[![Twitter](https://img.shields.io/badge/twitter-@SWframeworks-blue.svg?style=flat)](http://twitter.com/SWframeworks)

A text field subclass with a constant text in the end or begin.
You can constant text to the end of the text field value or begin of the text field value.

![PartiallyEditField.gif](https://raw.githubusercontent.com/isamankumara/PartiallyEditField/master/PartiallyEditField.gif)

# Requirements
This need uikit that's only thing you need.

#How to apply to Xcode project
### Downloading Source Code
- [Download SWNetworking](https://github.com/isamankumara/PartiallyEditField/archive/master.zip) from gitHub
- Add required frameworks
- import "PartiallyEditField.h" to your source code file

### Using CocoaPods
```ruby
pod "PartiallyEditField"
```

If you are new to CocoaPods, please go to [Wiki](https://github.com/skywite/SWNetworking/wiki/CocoaPods-in-to-Xcode-Project) page.

### Communication

- If you **need any help**, use [My Site](https://isamankumara.com/frameworks/). and send a message
- If you'd like to **ask a general question**, use [My Site](https://isamankumara.com/frameworks/).
- If you **found a bug**, _and can provide steps to reliably reproduce it_, open an issue or you can contribute.
- If you **have a feature request**, send a request mail we will add as soon as possible.
- If you **want to contribute**, submit a pull request.


### `constant` sample for left side

```objective-c
[_leftPreTxtField setupWithPreText:@".slack.com" color:[UIColor redColor]];
```
### `constant` sample for right side
```objective-c
[_rightPreTxtField setupWithPreText:@"www." color:[UIColor redColor]];
_rightPreTxtField.preTextSide = kLeft;
```

### `More` info and dificulities  

Go to [About PartiallyEditField]((https://isamankumara.com/frameworks/)) and how to use attributted place holder

# Credits

`PartiallyEditField` is owned and maintained by the [saman kumara](https://www.isamankumara.com)
`PartiallyEditField` was originally created by [saman kumara](https://www.isamankumara.com). If you want to contact [me@isamankuamra.com](mailto:me@isamankumara.com)

# License   
`PartiallyEditField` is released under the MIT license. See LICENSE for details.
