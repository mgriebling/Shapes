# Shapes
Demonstration of converting text strings to bezier graphic entities.  Works on iOS or Mac.

I've been scouring the web to find how to convert text and attributed text to graphic entities.
Really surprised this is so hard.  Fortunately I found inspiration by work from Mohammid Ali Jafarian
and some Stackoverflow contributers.

My main contribution was to get this working on **all** iOS and Mac devices with no code changes.

Here are some samples:

<img width="721" alt="Screenshot 2023-03-22 at 10 47 51 AM" src="https://user-images.githubusercontent.com/2421348/226944396-17e9df3d-fbbb-4016-a866-eb632bffeb92.png">

![Simulator Screen Shot - iPhone 14 Plus - 2023-03-22 at 10 49 12](https://user-images.githubusercontent.com/2421348/226944484-11509aac-8434-4b18-917d-5fe278b38e47.png)

As you can see, it's not perfect but seems to mostly work.  The SwiftUI Text view seems to do some magic so that even color glyphs work.
Please let me know if you figure out how to modify my glyph routines if you get this to work.

Enjoy!
