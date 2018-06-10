---
title: "Developer interview: David Amador - Upfall Studios"
date: 2018-06-10T09:20:29+01:00
draft: false
categories: ["Interviews", "Developer Interviews"]
small_images:
- "/img/david-amador.jpeg"
---
<img src='/img/david-amador.jpeg' style='float:right; width:200px; margin-left:15px'/>

I've been following [David Amador](https://twitter.com/DJ_Link) for a long time.
He's a _one man team_ that created the [Quest of Dungeons](https://www.questofdungeons.com/) game.
This game is available in 10 platforms, like for example on [Steam](https://store.steampowered.com/app/270050/Quest_of_Dungeons/),
[Xbox](https://www.microsoft.com/en-us/p/quest-of-dungeons/bswtdr8hbm1w),
[Playstation](https://www.playstation.com/en-us/games/quest-of-dungeons-ps4/),
[Apple Store](https://itunes.apple.com/us/app/quest-of-dungeons/id698726956?mt=8),
[3DS](https://www.nintendo.com/games/detail/quest-of-dungeons-3ds)
and [Nintendo Switch](https://www.nintendo.com/games/detail/quest-of-dungeons-switch).

This blog is much about team leading, and it may seem off to interview an one
man show. But I do believe that to lead others, we need to lead ourselves first.

I always found interesting all the things that David is able to accomplish and
on this interview I tried to understand better what makes him tick.

<div style='clear:both'></div>

<!--more-->

> Hey David, can you talk a bit about your background and about what you do?

Hey Pedro,

My work right now involves what I like to call "wearing many hats". I'm a solo
independent game developer, trying to run my own studio Upfall Studios, making
games from all sorts of platforms, mobile, desktops and consoles. While I get
people to help in parts I'm not good at, on my day to day I end up having to
touch a little bit of this and that, from coding, to sound effects to marketing.

I started computer programming at the University, went back in forward to 3D
modeling as well but eventually sticked with coding as my main focus, so most
of my days are spent coding.

> Your most famous(?) game is Quest of Dungeons. Can you talk a bit about it?

Yes, Quest of Dungeons is my most popular game, many people think it's my first
game but it was in fact my 4th commercial one. QoD is a turn-based roguelike
with a 16-bit retro look, a kind of dungeon crawler that takes place inside a
mansion, you have to reach the last floor and defeat a boss in order to retrieve
light to the world. The whole game is procedural so that means each time you
start a new game the dungeons layout is different, monsters and items are in a
different place so each new run is never the same. Another thing is that you
don't get continues or lives, you can save at any point, but if you die it's
permanent, your save is deleted and you have to start from the beginning, no
do-overs, so each step does matter.

> That's very interesting. Can you talk a bit about how you implemented the
> "new levels on every game"? How do you test it and make sure that for example
> the player won't be stuck somewhere? Or that some levels are much more
> difficult than others?

Everything that is not custom built is based on a set of rules, so certain
things never happen, for example an obstacle close to a door, rendering that
level useless.

When creating the dungeons I try to set rooms close to each other, if I can
put a passage it's valid and I move on, each room has to have at least 1
passage, otherwise it would be a dead end. The rule is a bit different for
locked rooms which you need a key, those I had to make sure they are not the
only passage for the rest of the dungeon, as the player might not have the key
or never even find it, they are optional. Some rooms are 100% procedural but
there are a few that are procedural + handcrafted, the initial room is an
example, there is always the death skull sign, but everything else is random.
This allowed me to set proper boss rooms, shopkeepers etc, but still maintaining
the randomness.

Balancing difficulty was the hardest, while the leveling up of characters is
built on formulas I had to fine tweak some things, I knew how strong a player
would be at a certain level, but the procedural nature of finding procedural
swords means that there can always be some unbalance there. Each floor has a
set of min and max level for monsters, also for all weapons/items generated,
so the thing that matters the most is the player own level when reaching that
part, and that part the player can control, just needs to level up a bit more
if something is too hard.

On top of that the different classes, ranged ones clearly have an advantage but
I ended up leaving it for a more casual gameplay, even though some people can
spot they are OP it's up to them if they want the extra challenge of a more
close combat class.

> Indeed there's a lot of logic over there. How do you make sure that changes
> to the code don't break things elsewhere? Or that that some minor change on
> some stat might unbalance the game somewhere?

It always involves some sort of manual testing, there's really no way around it,
because of the procedural nature automated tests only go so far, many things I
only realized after launching the game.

Char Stats were based on formulas so I know where they'll be at a certain level
but unbalance will often come from external factors, amount of monsters, items
you found, etc.

A curiosity, I can say that I only found out there was a bug in the dungeon
generation after ~3y, a brute force testing gen dungeons for ~10h would
sometimes generate one without solution, I had never forced it to test for so
long. No one ever complained about this, I just happened to find while running
automated tests for the Nintendo 3DS for memory leaks after a few days of
running the game.

> You have ported the game for several platforms. Can you talk a bit about the
> quality procedures you have to undertake? Anything particular that was harder
> to accomplish?

Some of them are protected by NDA on PlayStation, Nintendo and Xbox, but there
are certifications the game MASTER has to pass in order to reach the store.
This goes from the regular "don't crash" to specific things for each platform,
usually things to make the game more user friendly to the consumer or respect
guidelines. I remember a "funny" one where pulling the ethernet cable from the
Xbox One while on Leaderboards (and internet communications) could crash the
game, stuff like that.

The most difficult platform I worked with was Nintendo 3DS, not only because of
the lower specs (6 MB VRAM, 268MHz CPU) but also it's nature of dual screen,
touch, shared resources with OS. Before this the lowest end device I had
tested the game on was a iPod Touch, and this was slower, it was a fun exercise
in seeing how Nintendo and other devs where pushing that hardware, also to see
how bad some of me code was and how to optimize it.

> And how do you manage all those versions? For example, image that you find a
> bug that happens in all versions and you have to fix it. Do you have branches
> for each version? Are they separate repos? Will you have to be subject to all
> the quality procedures again?

All versions exist in the same branch, so usually a bug fix will only be as 
complicated as the bug itself. The exception will be platform specific ones or
UI, because right now there are a couple of different versions: Mobile (touch),
PC (KB, Mouse), consoles (GamePad), 3DS (dual screen + touch), and all these
have different things to it, to make it fit to the platform, so these can be
complicated, like adding new features or things like that.

The worst part is really the testing and making sure I didn't break anything
else, it's time consuming, because right now I have 10 platforms and ~14 SKUs.
Having launched them separated from each other has usually allowed me to leave
the previous platform more or less stable, a simultaneous release on all the
platforms would be nearly impossible for just one person.

> That's a lot to handle that's for sure. How do you organise yourself? Not
> only you have to develop things, but also do all task management, expectations
> management, etc. Do you have for example a roadmap?

A mix of Google Docs, Asana and physical notebook. Because I don't need to share
it with anyone I never really found myself doing a proper roadmap or writing
many things down apart from bugs or some tasks.

Usually when I started a new port I would take 1-2 days to write down all tasks
on paper, and would go from there. I'm a bit unorganized overall.

> And how to you cope on being a one man team? Sometimes people doing remote
> complain about the lack of social interactions. What to do do to keep
> motivated and one step ahead?

It's not easy and I've been feeling it a bit more recently, as I'm
transitioning to a new game, I try to talk to other people in the same situation,
talking through some particular project issue or even exchange "motivation".
Projects can take years and that middle part where something is not ready to
start showing and you can't even properly explain to someone what you're working
can be tough. Also sometimes having new ideas for new games when you're feeling
a bit down doesn't help eheh. But I try to stay positive and keep working on
the tasks.

Because 95% of my work is digital, social interaction can be a problem if one
doesn't actively seek out to change that, especially working from home, even if
you working with someone remotely, its just digital. For the past year I've
been trying to work on several places during day: libraries, coffee shops,
public spaces, it kinda helps giving a sense of "office" space and
even schedules.

> David, thanks for your time and best of luck on your projects. To close up
> the interview:

> - Can you reference some topics you'd like to see discussed here about engineering management?
> - Can you suggest someone else for me to interview?

Thank you and for the invitation.

More topics about managing small mid-sized teams remotely. Remote work is
increasingly popular but for most people it's still uncharted waters. I talked
to a few people in the past and it's usually interesting to learn more.

I would suggest these lovely game development related people

* [Fi](https://twitter.com/fifsilva) (3d Artist)
* [Tiago](https://twitter.com/TRodriguesMusic) (Freelance music composer)
* [Daniela](https://twitter.com/DanielaFIFO) (Game Developer MimicryGames)
* [Ivo](https://twitter.com/duarteivopt) (The Inner Sea)
* [Leo](https://twitter.com/LeonorParra08) (Founder of Vertical Reach)
