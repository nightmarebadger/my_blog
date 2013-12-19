---
categories: python
date: 2013/12/19 21:16:00
title: Python in the wide world week - day 4, EVE Online
---

## [EVE Online]

<a href="http://www.eveonline.com/"><img src="/images/eve_online.jpg" alt="EVE Online"></a>

### What is Eve Online?

[EVE Online] is a player-driven persistent world MMORPG set in a science
fiction space setting. Featuring seemingly infinite customisation on both your
pilot and your ships and a huge world, it definitely is an unique game.

What makes it even more special is the fact that EVE Online uses only one
"shard" - all players live in the same world (as opposed to many popular
MMORPGS, where players play on different "shards" or servers). It also features
a very "real" world, in which there is no "right" way to play - you can be a
mercenary, a miner, a trader, a member of a giant alliance (where you work with
thousands of other players towards a single goal) ... there are practically no
game or moral limits (you can sabotage other players, or even [scam players out
of their
money](http://massively.joystiq.com/2012/10/28/eve-evolved-top-ten-ganks-scams-heists-and-events/))
- it's all legitimate and won't have any repercussions from the game developers
  / GM's, not that that can help you much when half of the player base turns
  against you.

For more info, look at the [official site](http://www.eveonline.com/) or
[FAQ](http://www.eveonline.com/faq/what-is-eve-online/)

### Where is Python used?

> Python enabled us to create EVE Online, a massive multiplayer game, in record
> time. The EVE Online server cluster runs over 50,000 simultaneous players in
> a shared space simulation, most of which is created in Python. The
> flexibilities of Python have enabled us to quickly improve the game
> experience based on player feedback
>
> -- Hilmar Veigar Petursson, CCP Games.


Both the server and client software for [EVE Online] are developed in
[Stackless Python](http://stackless.com/), which allows a large number of
players to perform tasks without the overhead of a call stack used in the
standard Python distribution. Going in depth about Stackless Python is out of
the scope of this blog post (and my current experience), but if you think it
would interest you, Google around for more info. You might also (or rather)
look at [PyPy](http://pypy.org/) which also supports stackless mode along with
many other features. Even [Christian
Tismer](https://plus.google.com/105712269316285036558/posts), the creator of
Stackless Python feels that "PyPy is much superior to Stackless itself and is
the way of the future".

### Gameplay example

To tell you the truth, I have no idea how EVE Online plays (except that it
apparently has many many lasers / disco lights in high-end battles :P), so just
have a look at a random gameplay video I found on the web.

<iframe width="560" height="315" src="//www.youtube.com/embed/WERqUb0G6vQ"
frameborder="0" allowfullscreen></iframe>

[EVE Online]: http://www.eveonline.com/
