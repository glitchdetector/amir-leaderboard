# Arroyo Muerto International Raceway Leaderboard
A FiveM server addition by glitchdetector

![FiveM_b3407_GTAProcess_PDYZrAQjUp](https://github.com/user-attachments/assets/df36c9ab-dcc2-49bc-913b-e82d642268a5)

## Note

This requires the Roxwood map expansion by The Ambitioneers https://ambitioneers.tebex.io/ (or else it's just in the middle of nowhere)

Renaming this resource might break the leaderboard, it should be `amir-leaderboard`

### ⚠ **You will need another script to control the display**
This script only enables the display, it does not do anything with it

## Description

This script enables the leaderboard at the Arroyo Muerto International Raceway

There is no built-in behavior for what to display, and is not the goal of this script.

There's a test command included (/speedway_example) that will display the leaderboard with some test data.

You can use this as a base to build your own leaderboard, or you can use the test command as a reference for how to display the leaderboard.

The leaderboard has 10 slots for race information; 9 racer slots and one slot for the current lap.

There are 3 types of text that can be displayed here:
 - Player Names, which are automatically shrunk to fit within 5 characters.
 - Times, which are displayed in the format of "MM:SS" (minutes, seconds).
 - Raw text, unfiltered text that is displayed as-is, can include html. Do keep in mind that this text is not shrunk to fit within 5 characters, so it may be cut off if it is too long.

The leaderboard has 3 spaces for advertisement images, which are displayed at the top of the leaderboard.

These spaces are set up to allow any image URL to be displayed, and are not limited to the default images.

## How to use:
Server-Side Events:

> TriggerEvent("amir-leaderboard:setPlayerTimes", title, times)

title being the text shown for the lap display

times being a list of times in milliseconds

Example:
```lua
TriggerEvent("amir-leaderboard:setPlayerTimes", "1", { 1000, 2000, 3000, 4000, 5000, 6000, 7000, 8000, 9000 })
```

> TriggerEvent("amir-leaderboard:setPlayerNames", title, names)

title being the text shown for the lap display

names being a list of names, which are automatically shrunk to fit within 5 characters

Example:
```lua
TriggerEvent("amir-leaderboard:setPlayerNames", "2", { "John", "Fred", "Bob", "Steve", "Joe", "Bill", "Tom", "Jerry", "Sam" })
```

> TriggerEvent("amir-leaderboard:setText", title, text)

title being the text shown for the lap display

text being a list of text, which is displayed as-is, can include html
Example:
```lua
TriggerEvent("amir-leaderboard:setText", "3", { "hello", "world", "this", "is", "a", "test", "of", "the", "leaderboard" })
```

> TriggerEvent("amir-leaderboard:setAdUrls", ad1, ad2, ad3)

ad1 being the URL of the first ad image

ad2 being the URL of the second ad image

ad3 being the URL of the third ad image

Example:
```lua
TriggerEvent("amir-leaderboard:setAdUrls", "https://example.com/image1.png", "https://example.com/image2.png", "https://example.com/image3.png")
```

Server-Side Exports:
This script also includes server-side exports for the same events as above.

> exports["amir-leaderboard"]:setPlayerTimes(title, times)

> exports["amir-leaderboard"]:setPlayerNames(title, names)

> exports["amir-leaderboard"]:setText(title, text)

> exports["amir-leaderboard"]:setAdUrls(ad1, ad2, ad3)
