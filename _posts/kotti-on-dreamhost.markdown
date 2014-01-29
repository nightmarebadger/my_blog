---
categories: kotti, dreamhost, python
date: 2014/01/29 07:09:09
title: Running Kotti on Dreamhost
---

Are you hosting on [Dreamhost] but aren't satisfied
with any of the [One-Click
Installs](http://wiki.dreamhost.com/Available_One_Click_Installs) they are
offering? Want a [Python]  ([Pyramid]) based CMS? Of course I'm talking about
[Kotti] and since the installation isn't hard
at all feel free to give it a go :).

This post is based on a guide found at [Rick's
Resources](http://www.ricksresources.com/2012/07/pyramid-on-dreamhost/), which
explains how to run [Pyramid] on [Dreamhost]. This post won't be as in-depth as
that guide is however, so if you want some extra information it's just a click
away.

## Prerequisites

Before we can run [Kotti] we need to make sure we have a few things set up:

* A [Dreamhost] account with shell access
* A domain or sub-domain with [passenger] enabled
* [Python] with virtualenv installed on your account
* A virtualenv set up with Kotti installed in it

I will not explain the first step, but read on for the other steps.

## Create a (sub) domain and enable [passenger]

XXX:
Get some screenshots and write exactly what you need to do

* Web directory: should end with `/public`
* Passenger (Ruby/Python apps only): `checked`

## Install [Python] with virtualenv on your account

XXX:
Write actual text, not just commands :P

    [sansalvador]$ cd
    [sansalvador]$ mkdir python
    [sansalvador]$ cd python
    [sansalvador]$ wget http://www.python.org/ftp/python/2.7.6/Python-2.7.6.tar.xz
    [sansalvador]$ tar xvf Python-2.7.6.tar.xz
    [sansalvador]$ cd Python-2.7.6
    [sansalvador]$ ./configure --prefix=$HOME/python
    [sansalvador]$ make
    [sansalvador]$ make install

Run python

    [sansalvador]$ ~/python/bin/python
    INFO
    >>>

Add Python to your PATH

    [sansalvador]$ echo 'export PATH=$HOME/python/bin:$PATH' >> ~/.bash_profile

After re-logging you can simply do

    [sansalvador]$ python
    INFO
    >>>

Installing virtualenv

    [sansalvador]$ wget https://pypi.python.org/packages/source/v/virtualenv/virtualenv-1.9.1.tar.gz
    ...
    [sansalvador]$ tar xzf virtualenv-1.9.1.tar.gz
    [sansalvador]$ cd virtualenv-1.9.1
    [sansalvador]$ python setup.py install
    ...
    [sansalvador]$ virtualenv --version
    1.9.1

[Kotti]: http://kotti.pylonsproject.org/
[Python]: http://www.python.org/
[Dreamhost]: http://www.dreamhost.com/
[Pyramid]: http://www.pylonsproject.org/
[passenger]: https://www.phusionpassenger.com/
