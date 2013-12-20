---
categories: python
date: 2013/12/20 22:18:00
title: Python in the wide world week - day 5, YouTube
---

One of the reasons why I started this series is because I've heard words like
"*Yeah, Python is nice ... but it's so __slow__ ... can you actually do
anything with it?*" too many times. And what is the answer? Just look at
YouTube's success.

## [YouTube]

<a href="http://www.youtube.com/"><img src="/images/youtube_logo.jpg" alt="YouTube"></a>

### What is YouTube?

I'm guessing that if you're reading this, you already know what YouTube is :)

### Where is Python used?

> Python is fast enough for our site and allows us to produce maintainable
> features in record times, with a minimum of developers
>
> -- Cuong Do, Software Architect

YouTube uses Python everywhere - from new features, searching / finding videos,
running the videos etc ... YouTube currently has well over 1 million lines of
Python code.

Mike Solomon gave a great talk at PyCon 2012 (below, **skip to the 10 minute
mark for the beginning of his talk** as the things before aren't really
interesting. )

<iframe width="480" height="360" src="//www.youtube.com/embed/G-lGCC4KKok" frameborder="0" allowfullscreen></iframe>

For me, there are two main points to this talk:

**_Start simple, grow when needed:_**

> A scalable system is one that's not in your way, that you're sort of unaware
> of. It's not buzzwords or anything like that, its just about a general
> problem solving ethos ... You need flexibility to solve problems and the
> minute you over specify something, you paint yourself into a corner.
>
> -- Mike Solomon, PyCon 2012

**_Stay flexible:_**

> How YouTube was originally designed had no bearing on what it actually
> became. Does anybody know that YouTube was a dating site? [\*laughter from
> audience\*] ... If we had designed for that I think we would be having a
> substantially different conversation.
>
> -- Mike Solomon, PyCon 2012

Let's get one thing out of the way. YouTube is not only big ... it's *huge*,
it's *colossal*, *enormous*, *massive*, *immense*, *tremendous* and any other
word you can think of. Let's look at some statistics[^1]

**Viewership**

  * More than 1 billion unique users visit YouTube each month
  * Over 6 billion hours of video are watched each month on YouTube—that's
    almost an hour for every person on Earth, and 50% more than last year
  * 100 hours of video are uploaded to YouTube every minute
  * 80% of YouTube traffic comes from outside the US
  * YouTube is localized in 61 countries and across 61 languages
  * According to Nielsen, YouTube reaches more US adults ages 18-34 than any
    cable network
  * Millions of subscriptions happen each day. The number of people subscribing
    daily is up more than 3x since last year, and the number of daily
    subscriptions is up more than 4x since last year

But still, YouTube manages to work it's way through all that data using
technologies that are often held in regard as "*slow*" or "*not good enough*",
such as [Python](http://www.python.org/), [Apache](http://www.apache.org/),
[MySQL](http://www.mysql.com/), ... and the way they do it is explained nicely
in the video, so it's a great watch for anyone that is interested in any kind
of development and deployment.

[YouTube]: http://www.youtube.com/
[^1]: <http://www.youtube.com/yt/press/statistics.html>
