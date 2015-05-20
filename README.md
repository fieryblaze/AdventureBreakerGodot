# Adventure Breaker: Godot
**Created By:** *FieryBlaze*

## About
Godot game engine port for 2D edition of my AdventureBreaker game.
For more info on the Godot engine, go to www.godotengine.org/wp/

## Objective
To lead a ball to the *Exit* while collecting *Items* and avoiding deadly *Blocks*

### To Win
Get a ball to the *Exit Block*

### To Lose
Have all of your balls destroyed or stuck

## Default Controls

| Action | Key |
|:-------|:----|
| Move Paddle Left | a, left arrow |
| Move Paddle Right | d, right arrow |
| Rotate Paddle Clockwise | e |
| Rotate Paddle Counter-Clockwise | q |
| Release Balls | spacebar |
| Flip Blocks | Left Ctrl, Left Mouse Button |
| Toggle Sticky Paddle | Left Alt, Right Mouse Button |
| Exit Game | Alt + F4 |

## Level Creation

In order to create your own level, all you have to do is modify the basic
text files **1Front** and **1Back** in the **Maps/1/** folder. Make sure to back them up if 
you want to keep level examples or the default level. **1Front** is the mapping for 
the front blocks, and **1Back** is the mapping for the back blocks.
*See the file _1Front_ in _Maps/1/_ folder for an example of a mapping using block names*
*See the rest of this _README.md_ for examples of mapping using block numbers*

All that is required for proper mapping is that the block names/numbers are
separated by a space, a tab, a new line, or any of these characters: ,.-;:_*
Any other formatting in the examples is for purely aesthetic reasons. Any invalid
block name/number will cause a blank space in the mapping (no brick in that 
position).

	The mapping is filled in from left to right, top to bottom, with each row
being 10 blocks wide. This means that if you want a 3x3 mapping, you can not 
just put in:

1,2,3
4,5,6
7,8,9

since this would show up in game as:

1,2,3,4,5,6,7,8,9

To get the mapping to go to the next row, the current row has to be filled in. So
in order to get the 3x3 mapping, the rows would need to be filled in with blank
spaces like so:

1,2,3,0,0,0,0,0,0,0
4,5,6,0,0,0,0,0,0,0
7,8,9,0,0,0,0,0,0,0

Or, without newline formatting, like this:

1,2,3,0,0,0,0,0,0,0,4,5,6,0,0,0,0,0,0,0,7,8,9,0,0,0,0,0,0,0

which will show up in game as:

1,2,3
4,5,6
7,8,9

The entire play area is 10x40 blocks, which can be seen filled in with '0' in the
file 'FullMap'.

### Special Note:
	If either the front or back block of a pair is an 'Unflippable' block, then
that whole pairing is 'Unflippable'.  This means that if you want to add the
unflippable status to any other block, all you have to do is make the back block
of the pairing an 'Unflippable' block.

Anything else can be learned by creating your own maps, so get to it, and have
fun!!!!

## Block Mapping

| Number | Type |
|:-------|:-----|
| 1 | Normal |
| 2 | Indestructible
| 3 | Unflippable
| 4 | Lava
| 5 | Multiball
| 6 | Sticky
| 7 | Exploding
| 8 | Exit
| 9 | LargePaddleItem
| 10 | SmallPaddleItem
| 11 | SlowMoItem
| 12 | SpeedUpItem
| 13 | StickyItem
