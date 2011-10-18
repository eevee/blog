---
categories: meta
date: 2011/10/17 21:36:00
title: In which i use GitHub, and IRC is awesome
---
I just wasted way too much time migrating all of my git repositories to [GitHub][github].  It's way less janky than the [old thing][gitweb], and the guys running it seem to be acceptably hipster-nerdy.

I'm still using Redmine as a [bug tracker][], and i have a cron going that updates the [old repositories][gitweb] regularly, so commits will still appear in tickets and whatnot.  This is just a change of canon.

I _am_ considering giving GitHub Issues a shot for small new projects, just to get a feel for it.  Redmine is powerful but feels like it's targeted at my manager.  GitHub is, i must admit, very much targeted at the people on the ground doing the hacking.

Anyway, here is a story.

GitHub has push notifications for a variety of services.  One of them is IRC.  It will actually fire up a bot, connect to your server, join your channel, and spit out new commits.  This is totally awesome, except that the bot doesn't hang around (understandably), and i don't really want join/part spam surrounding every single commit.

The bot can try to notify without joining the channel, but i couldn't find a way to let a specific client punch through `+n`, and IRC server developers kind of frown on hiding joins because it leads to crazy spying from opers.  I was considering just setting #veekun `-n` and hoping for the best.

Until [habnabit][] proposed the following.

    /mode #veekun -n
    /mode #veekun +b m:*!*@*
    /mode #veekun +e m:j:#veekun
    /mode #veekun +e m:github!*@*

This will:

* Allow anyone to talk to the channel, without being in it.
* Prevent anyone from talking in the channel at all.
* Exempt people already in the channel from the above ban.
* Exempt the github bot from the above ban.

This is so stupid.  I can't believe it works.  Channel matching is meant for teenaged channel warfare or keeping out a known cluster of riffraff, not recursive shenanigans like this.  I am delighted.

For the benefit of fellow googlers: this is how GitHub's IRC bot can notify your channel without joining or parting.  I'm using Inspircd 2.0, but other ircds tend to have similar matching and muting.


[bug tracker]: http://bugs.veekun.com/
[github]: https://github.com/eevee
[gitweb]: http://git.veekun.com/
[habnabit]: http://www.habnabit.org/
