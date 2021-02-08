# Exercise-02b-Mouse-and-Keyboard

Exercise for MSCH-C220, 8 February 2021

A demonstration video of this exercise is available here: [https://youtu.be/NsSq-_W-BVI](https://youtu.be/NsSq-_W-BVI).

This exercise is the first opportunity for you to play with keyboard and mouse input in Godot. The project will allow you to adjust the 2D rotation and position of a Node2D using player input. 

Fork this repository. When that process has completed, make sure that the top of the repository reads [your username]/Exercise-02b-Mouse-and-Keyboard. *Edit the LICENSE and replace BL-MSCH-C220-S21 with your full name.* Commit your changes.

Press the green "Code" button and select "Open in GitHub Desktop". Allow the browser to open (or install) GitHub Desktop. Once GitHub Desktop has loaded, you should see a window labeled "Clone a Repository" asking you for a Local Path on your computer where the project should be copied. Choose a location; make sure the Local Path ends with "Exercise-02b-Mouse-and-Keyboard" and then press the "Clone" button. GitHub Desktop will now download a copy of the repository to the location you indicated.

Open Godot. In the Project Manager, tap the "Import" button. Tap "Browse" and navigate to the repository folder. Select the project.godot file and tap "Open".

You will now see a simple scene, containing a parent Node2D and a Node2D (called Player) which contains a Sprite. Player has a script attached to it (Player.gd) which doesn't do too much for now; it makes sure the player stays on the screen (the `clamp` statements) and calls the get_input function to see how the Player should be accelerated (0 for now).

The first step, however, is to add inputs to the Input Map. In the Project menu, choose Project Settings, and select the Input Map tab. Near the top of the window is an "Action:" text box with an "Add" button next to it. Add the following inputs to the map (*case is important, so make sure these are all lower case*):

 * up
 * down
 * left
 * right
 * quit

Now, scroll down in the list to see the inputs you have just added. At the right of the window on the "up" line, you should see a plus sign. Select "key". When the resulting window appears, type w and then push "OK".

Repeat the process for the rest of the inputs: up (w), down (s), left (a), right (d), quit (esc). Close the window.

Now return to the Player.gd script. Starting on line 15, paste in the following code:
```
	var r = get_viewport().get_mouse_position().x
	midpoint = position.x
	if abs(r - midpoint) > margin:
		rotation_degrees += (r - midpoint)*rot_amount
```

Be careful to ensure that the resulting code is inserted with tabs.

This finds the current location of the mouse (and assigns the x-coordinate to r). It determines if the mouse is to the right or left of the player, and as long as it is farther than margin (5) pixels away, rotates Player as a function of the distance (determined by rot_amount). This will happen every frame.

Save the scene and run it. You should now be able to rotate the Player by moving the mouse to the left or right (counter- or clockwise).

Next, let's enable keyboard control. Replace the get_input function with this:

```
func get_input():
	var input_dir = Vector2(0,0)
	if Input.is_action_pressed("up"):
		input_dir.y -= 1
	if Input.is_action_pressed("down"):
		input_dir.y += 1
	if Input.is_action_pressed("left"):
		input_dir.x -= 1
	if Input.is_action_pressed("right"):
		input_dir.x += 1
	return input_dir.rotated(rotation)
```

Be careful to ensure that the resulting code is inserted with tabs instead of spaces.

This will accelerate the Player in the direction it is facing by pushing the w key. It can be accelerated backwards or left or right using the other WASD keys.

Test it and make sure this is working correctly. The get_input function is probably a good snippet to add to your gists.

Quit Godot. In GitHub desktop, you should now see the updated files listed in the left panel. In the bottom of that panel, type a Summary message (something like "Completes the mouse and keyboard exercise") and press the "Commit to master" button. On the right side of the top, black panel, you should see a button labeled "Push origin". Press that now.

If you return to and refresh your GitHub repository page, you should now see your updated files with the time when they were changed.

Now edit the README.md file. When you have finished editing, commit your changes, and then turn in the URL of the main repository page (https://github.com/[username]/Exercise-02b-Mouse-and-Keyboard) on Canvas.

The final state of the file should be as follows (replacing my information with yours):
```
# Exercise-02b-Mouse-and-Keyboard
Exercise for MSCH-C220, 8 February 2021

A simple game exploring mouse and keyboard control of Node2D translation and rotation.

## To play
Use WASD keys to accelerate the player. If the mouse cursor is to the left of the player, it will rotate counter-clockwise. If it is to the right, it will rotate clockwise.

## Implementation
Built using Godot 3.2.2

## References
None

## Future Development
None

## Created by 
Jason Francis

```
