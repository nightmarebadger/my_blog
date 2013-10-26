
# What is Cocos2d?

* Framework for building 2D games, demos and other graphical/interactive
applications that builds on Pyglet
* Main features:
    * **Flow control**: Manage the flow control between different scenes in an
easy way
    * **Sprites**: Fast and easy sprites
    * **Actions**: Just tell sprites what you want them to do. Composable
actions like move, rotate, scale and much more
    * **Effects**: Effects like waves, twirl, lens and much more
    * **Tiled Maps**: Support for rectangular and hexagonal tiled maps
    * **Transitions**: Move from scene to scene with style
    * **Menus**: Built in classes to create menus
    * **Text Rendering**: Label and HTMLLabel with action support
    * **Documentation**: Programming Guide + API Reference + Video Tutorials +
Lots of simple tests showing how to use it
    * **Built-in Python Interpreter**: For debugging purposes
    * **BSD License**: Just use it
    * **Pyglet Based**: No external dependencies
    * **OpenGL Based**: Hardware Acceleration

# 3D game development in Cocos2d

* Cocos2d (and pyglet) by default uses a 3D projection matrix (most of the
transitions and effects are actually 3D)
* Since we have access to OpenGL, you can use it directly to draw 3D objects
* You will have to make your own logic for 3D camera, 3D collision detection
etc., prefferably using numpy or something similar for computations ...

* ... unless you use one of the libraries built on top of Cocos2d that support
3D development

# Cocos2d basics

* Make a Scene
* Add needed Sprites etc. to the Scene
* Run the scene with _cocos.director.director_

Cocos2d automatically takes care of drawing all Sprites that were added to a
Scene, so we do not need to override the **on_draw()** function.

# Scenes

* More or less independent pieces of the app workflow, glued together by the
_Director_
* Your application can have many _Scenes_ ...

* ... but only one _Scene_ is active at a given time

* Example scenes:
    * Intro
    * Menu
    * Level
    * Winning scene
    * Losing scene

* Scenes are usually further divided into Layers

# Layers

* Layers help you organise the scene on the front to back axis
* Usually transparent sheets where children are drawn, the scene then stacks the
sheets

* Example layers:
    * Background: landscape
    * Far: decorations
    * Middle: gameplay elements
    * Near: player, enemies
    * HUD: game stats, life, etc.

# Handling key presses

* Inside your Layer, set **is_event_handler = True**
* Use pyglet events functions

* When defining events in _Layers_, they will be prioritised front to back

* You can also define your own events

# Sample bare bones program


$$code(lang=python)
import cocos

if __name__ == '__main__':
    cocos.director.director.init()
    scene = cocos.scene.Scene()
    cocos.director.director.run(scene)
$$/code

# Translate from Pyglet to Cocos2d

* Define a Game layer, set it to handle events
* Use Cocos2d sprites and batches, add them to the game layer
* For player movement, use _Sprite.velocity_ and the _Move_ action


$$code(lang=python)
Sprite.do(action)
$$/code

# Add enemy movement

* We want the enemies to move around
* To do this, we will use _cocos.actions_ on our Sprites
* We will use a combination of many different actions to produce different
movements

Actions can be combined, multiplied, reversed etc.


$$code(lang=python)
Sprite.do( (MoveBy((120, 0), 1) + Delay(0.5) + MoveBy((0, 120), 1)) * 5 )

action = MoveBy((200, 0), 1)
Sprite.do(action + Reverse(action))
$$/code

Actions for moving the 6 enemy sprites


$$code(lang=python)
move_basic = MoveBy((120, 0), 1)
self.enemies[0].do(Repeat(move_basic + Reverse(move_basic)))
self.enemies[1].do(Repeat(Reverse(move_basic) + move_basic))

move_complex = (MoveBy((-75, 75), 1) +
                            Delay(0.5) +
                            MoveBy((-75, -75), 1) +
                            Delay(0.5) +
                            MoveBy((75, -75), 1) +
                            Delay(0.5) +
                            MoveBy((75, 75), 1) +
                            Delay(0.5))
self.enemies[2].do(Repeat(move_complex))
self.enemies[3].do(Repeat(Reverse(move_complex)))

move_jump = AccelDeccel(JumpBy((200, 0), 75, 3, 3))
move_jump_rot = AccelDeccel(RotateBy(360, 3))
self.enemies[4].do(Repeat(move_jump + Reverse(move_jump)))
self.enemies[4].do(Repeat(move_jump_rot + Reverse(move_jump_rot)))
self.enemies[5].do(Repeat(Reverse(move_jump) + move_jump))
self.enemies[5].do(Repeat(Reverse(move_jump_rot) + move_jump_rot))
$$/code

# Add collision detection

* We will use a simple brute force alghoritm (from cocos2d)

* Set a CollisionManager
* Each sprite that we want to be collideable needs to have a .cshape (circular
or rectangular) property
* Add each sprite to the manager
* We will be able to use manager.objs_colliding(self.player) to get a list of
every object that collides with our player

* We also need a way to check for collisions each frame
* Each time we move a sprite, we need to update its .cshape property position

# Make sprites collideable

Adding player to the collision manager


$$code(lang=python)
self.collision_manager = cm.CollisionManagerBruteForce()

self.player = cocos.sprite.Sprite(resources.player)
self.player.position = 400, 25
self.player.velocity = 0, 0
self.player.speed = 150
self.add(self.player, z=2)

self.player.cshape = cm.AARectShape(
    self.player.position,
    self.player.width//2,
    self.player.height//2
)
self.collision_manager.add(self.player)
$$/code

# Check for collisions on each frame

We will use .schedule() to schedule an update function on each frame. We do this
in our layer `.__init__()`


$$code(lang=python)
self.schedule(self.update)
$$/code

In the update function we update all .cshape positions and check for collisions


$$code(lang=python)
def update(self, dt):
    self.player.cshape.center = self.player.position
    for enem in self.enemies:
        enem.cshape.center = enem.position

    collisions = self.collision_manager.objs_colliding(self.player)
    if collisions:
        if self.boss in collisions:
            print("You won!")
        cocos.director.director.pop()
$$/code

# Add menus

* We will use the _cocos.menu.Menu_ class to add two menus, a "Main menu" and
"Options menu"
* To make a menu:
    * Make a list of _cocos.menu.MenuItem_, which take a title and a function to
call when this item is selected
    * Call the _`.create_menu()`_ method to create the menu

For the FPS toggle we use _cocos.menu.ToggleMenuItem_ instead of the normal one.
It takes the title, the function to call and the toggle value to show.

# Main menu

Main menu has 3 choices:

* New game: starts a new game
* Options: switch to the options menu
* Quit: quits the game


$$code(lang=python)
class MainMenu(cocos.menu.Menu):

    def __init__(self):
        super( MainMenu, self).__init__('Catch your husband!')

        items = []

        items.append(cocos.menu.MenuItem('New game', self.on_new_game))
        items.append(cocos.menu.MenuItem('Options', self.on_options))
        items.append(cocos.menu.MenuItem('Quit', self.on_quit))

        self.create_menu(items)

    def on_new_game(self):
        game_layer = Game()
        game_scene = cocos.scene.Scene(game_layer)

        cocos.director.director.push(game_scene)

    def on_options( self ):
        self.parent.switch_to(1)

    def on_quit(self):
        pyglet.app.exit()
$$/code

# Options menu

The options menu has 3 choices:

* FPS toggle: show/hide FPS
* Fullscreen toggle: switch between fullscreen and windowed
* Back: back to main menu


$$code(lang=python)
class OptionsMenu(cocos.menu.Menu):
    def __init__(self):
        super( OptionsMenu, self).__init__('Catch your husband!')

        items = []

        items.append(cocos.menu.ToggleMenuItem(
            'Show FPS:',
            self.on_show_fps,
            cocos.director.director.show_FPS)
        )
        items.append(cocos.menu.MenuItem('Fullscreen', self.on_fullscreen))
        items.append(cocos.menu.MenuItem('Back', self.on_quit))
        self.create_menu(items)

    def on_fullscreen( self ):
        cocos.director.director.window.set_fullscreen(
            not cocos.director.director.window.fullscreen)

    def on_quit( self ):
        self.parent.switch_to( 0 )

    def on_show_fps( self, value ):
        cocos.director.director.show_FPS = value
$$/code

# Start with the menu, not with the game

When the game loads, we want to open the menu, not the game. We need to change
the initialisation from


$$code(lang=python)
cocos.director.director.init(
    width=800,
    height=650,
    caption="Catch your husband!"
)

game_layer = Game()
game_scene = cocos.scene.Scene(game_layer)

cocos.director.director.run(game_scene)
$$/code

to


$$code(lang=python)
cocos.director.director.init(
    width=800,
    height=650,
    caption="Catch your husband!"
)

scene = cocos.scene.Scene()
scene.add(cocos.layer.MultiplexLayer(MainMenu(), OptionsMenu()), z=1)
cocos.director.director.run(scene)
$$/code

The old code for starting the game was moved to the Main menu, inside the
_`on_new_game()`_ function.

# Finishing touches

Our game still looks very "bare", so let's add some simple things to spice it
up! We will:

* Add a nice background to the menus
* Customise the menus
* Add sounds and music
* Add a nice transition when starting a new game

# Adding a background to the menus

We will make a background layer that will have:

* A background picture
* Our player sprite jumping up and down
* An enemy sprite moving left and right
* The boss (aka our player's husband) looking menacing


$$code(lang=python)
class BackgroundLayer(cocos.layer.Layer):
    def __init__(self):
        super(BackgroundLayer, self).__init__()
        self.image = cocos.sprite.Sprite(resources.background)
        self.image.position = 400, 325
        self.add(self.image, z=0)

        self.player = cocos.sprite.Sprite(resources.player)
        self.player.position = 200, 75
        self.add(self.player, z=1)

        self.enemy = cocos.sprite.Sprite(resources.enemy)
        self.enemy.position = 400, 75
        self.add(self.enemy, z=1)

        self.boss = cocos.sprite.Sprite(resources.boss)
        self.boss.scale = 0.4
        rect = self.boss.get_rect()
        rect.midbottom = 600, 50
        self.boss.position = rect.center
        self.add(self.boss, z=1)

        self.player.do(Repeat(JumpBy((0, 0), 100, 1, 1)))
        self.enemy.do(Repeat(
            MoveBy((-25, 0), 0.25) +
            MoveBy((50, 0), 0.5) +
            MoveBy((-25, 0), 0.25)))
        self.boss.do(Repeat(FadeTo(155, 0.5) + FadeTo(255, 0.5)))
$$/code

Add it to the scene in the initialisation


$$code(lang=python)
scene = cocos.scene.Scene()
scene.add(cocos.layer.MultiplexLayer(MainMenu(), OptionsMenu()), z=1)
scene.add(BackgroundLayer(), z=0)
cocos.director.director.run(scene)
$$/code

# Customise the menus

To customise the menus, we will:

* Change the font family, it's size and color
    * The base font will be completely white, so it is easier to see/read
    * The selected menu item will be a nice pink color to complement our heroine
* Add a sound when moving around the menu
* Make the items shake around on selection


$$code(lang=python)
self.select_sound = resources.menu_sound

self.font_title['font_name'] = 'Edit Undo Line BRK'
self.font_title['font_size'] = 52
self.font_title['color'] = (240, 0, 220, 255)

self.font_item['color'] = (255, 255, 255, 255)
self.font_item_selected['color'] = (240, 0, 220, 255)

...

self.create_menu(items, cocos.menu.shake(), cocos.menu.shake_back())
$$/code

# Add music

We want some music to be playing while we play the game. We will use
"tetrico.mp3", which is bundled in cocos2d examples folder.

To play music we must:

* Define a _pyglet.media.Player()_
* Start the music when we enter the game
* Pause and rewind it when we stop the game (go back to the menu)

We define the player in the initialisation with


$$code(lang=python)
music_player = pyglet.media.Player()
music_player.volume = 1
$$/code

Start and stop the music inside the Game layer


$$code(lang=python)
def on_enter(self):
    super(Game, self).on_enter()

    try:
        music_player.queue(resources.game_music)
    except:
        pass

    music_player.play()

    music_player.eos_action = 'loop'


def on_exit(self):
    super(Game, self).on_exit()

    music_player.seek(1)
    music_player.pause()
$$/code

# Add a fancy transition

To add a transition to the Game, we simply need to change the game starting code
(in main menu) from


$$code(lang=python)
cocos.director.director.push(game_scene)
$$/code

to


$$code(lang=python)
cocos.director.director.push(
            FlipAngular3DTransition(game_scene, 1))
$$/code

which will use the _FlipAngular3DTransition_ transformation lasting 1 second to
change the scenes.

# To infinity ... and beyond!

Of course we do not have to stop here. For added ideas we could also add:

* Lives: getting hit by one of your husband henchmen doesn't knock you out
immediately, but rather shows a fancy blur/wave effect eminating from your
position
* Make a "game won" and "game over layer"
* Make an intro with automatically scrolling story text with background music
* Add some more effects ...

* ... just do not overuse them, it won't look good!

# Thank you for your attention! :)

### Any questions?
