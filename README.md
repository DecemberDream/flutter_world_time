# World Time

This is a simple Flutter project which makes use of the [WorldTimeAPI](https://worldtimeapi.org/) to fetch the times of many cities world wide.

## The App

Essentially, the app has 2 screens, including a loading screen. The home screen looks as follows (note: the dark background is chosen if the time is between 6am - 8pm).

[![night.png](https://i.postimg.cc/Bb9Ljrzn/night.png)](https://postimg.cc/R6dV8D9k)
[![day.png](https://i.postimg.cc/3NXymLMC/day.png)](https://postimg.cc/dZ0tKjVL)

In order to change the city, click on 'Edit Location'. The following screen shows the implemented cities:

[![loc.png](https://i.postimg.cc/V6b0LfDh/loc.png)](https://postimg.cc/5Yb2sVc5)

## Setup

If you want to build this project yourself, first make sure that you have a funcitoning flutter installation using `flutter doctor`.

Next, either clone this repository or download the .zip file. Enter the repository with `cd flutter_world_time`.

In order to build it and to install it to your device use the following commands:

```
$ flutter build apk
$ flutter install
```

After that, the app will be installed onto your device and it's ready to be used!
