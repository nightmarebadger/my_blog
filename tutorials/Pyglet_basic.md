
# 2D and 3D game development using Pyglet with Cocos2d

### By Natan Žabkar

# About me

* Natan Žabkar, aka "nightmarebadger"
* Self-learned programmer
* Student of mathematics at FMF
* Tutor/demonstrator at FMF
* Python web developer at Termitnjak d.o.o

# Why game development?

* Making games is a great way to see your imagination grow "real"
* Playing games is fun ...

* But making them can be even more fun! :)

# Why Pyglet?

* Clean and easy
* Very "pythonic"
* No external dependencies or installation requirements
* Uses OpenGL behind the scenes, so everything is hardware accelerated

# Pyglet basics

* Define a window object
* Override the _`on_draw()`_ function
* Schedule your game logic using _pyglet.clock_
* Run the application with _pyglet.app.run()_

# Sample bare bones program


    import pyglet
    
    game_window = pyglet.window.Window()
    
    @game_window.event
    def on_draw():
        game_window.clear()
        
    def update(dt):
        pass
    
    if __name__ == '__main__':
        pyglet.clock.schedule_interval(update, 0.5)
        pyglet.app.run()

# Resources

* Manage resources separately, so you only need to load them once
* Sample resources.py


    import pyglet
    
    pyglet.resource.path = ["resources"]
    pyglet.resource.reindex()
    
    player = pyglet.resource.image("player.png")
    enemy = pyglet.resource.image("enemy.png")

# Sprites

* Use sprites to easily draw 2D images, move them around, scale them, rotate
them ...
* Your player/monster classes will usually be a subclass of
_pyglet.sprite.Sprite_


    player = pyglet.sprite.Sprite(resources.player, x=400, y=400)
    player.scale = 2
    player.rotation = 45
    player.x = 600

# Sprite batches

* Use batches for optimised drawing


    batch = pyglet.graphics.Batch()
    player = pyglet.sprite.Sprite(resources.player, x=400, y=400, batch=batch)

# Handling key presses

You handle keyboard and mouse presses with game window events


    @game_window.event
    def on_key_press(symbol, modifiers):
        # Keyboard key is pressed
    
    @game_window.event
    def on_key_release(symbol, modifiers):
        # Keyboard key is released
    
    @game_window.event
    def on_mouse_press(x, y, button, modifiers):
        # Mouse key is pressed
    
    @game_window.event
    def on_mouse_release(x, y, button, modifiers):
        # Mouse key is released
    
    @game_window.event
    def on_mouse_scroll(x, y, scroll_x, scroll_y):
        # Mouse scroll wheel is used (scrolled, not clicked)
    
    @game_window.event
    def on_mouse_motion(x, y, dx, dy):
        # Mouse is moved without any button being pressed
    
    @game_window.event
    def on_mouse_drag(x, y, dx, dy, buttons, modifiers):
        # Mouse is being moved while a button is pressed

# Catch your husband!

We will now make a very simple game, named "Catch your husband!".

# Story

You are a simple housewife, but when your husband (a mafia crime lord) hasn't
been home for dinner in two days it's time to show him who wears the pants in
your house!

# Features

* 3 different sprites (made by the very talented **Tjaša Žabkar**)
* Player movement

...

Yup, that's it. Don't worry, we will add more features soon :)
