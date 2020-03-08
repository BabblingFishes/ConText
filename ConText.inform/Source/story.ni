"ConText" by Zoe "Fish" Cagle

[NOTE §6.17. Clarification and Correction]

[walk backwards]
[reattach w/o specifying chair]
[look west]

Section - Going back

The former location is a room that varies. 

Returning is an action applying to nothing.
Understand "return", "retreat", "run away", "back", and "go back" as returning.

First carry out going rule: 
	now the former location is the location. 

Check returning:
	if the former location is the location:
		say "You're not sure which way that is." instead.

Carry out returning:
	let back be the best route from the location to the former location, using doors; 
	if back is a direction, try going back; 
	otherwise say "You can't seem to find a way back.".

Section - Small talk

Talking to is an action applying to one thing.
Understand "talk to [someone]" and "chat with [someone]" as talking.

Carry out talking to something:
	let N be a random number between 0 and 3;
	if N is 0:
		say "you ask [the noun] about themself.";
		try asking the noun about "themself";
	if N is 1:
		say "you tell [the noun] about yourself.";
		try telling the noun about "yourself";
	if N is 2:
		say "you ask [the noun] about the weather.";
		try asking the noun about "the weather";
	if N is 3:
		say "you ask [the noun] about their day.";
		try asking the noun about "their day".

Section - Default Command Edits

Understand "inspect [something]" or "look at [something]" as examining.
Understand "look around" or "examine room" as looking.
Understand "place [something] on [something]" as putting it on.
Understand "ask [someone] about [text]" or "tell [someone] to [text]" as telling it about.

Understand "take all" as a mistake ("You wouldn't know where to start.").

Instead of asking someone about something: 
	try telling the noun about it. 

Does the player mean taking something enclosed by the player: it is very unlikely.

Section - Global Types

A floor is a kind of thing. A floor is scenery.

A weird door is a kind of door that is fixed in place. A weird door can be N, S, E, or W. A weird door is usually closed.

Section - Health

The player has a number called maxHealth. The player has a number called health. The maxHealth of the player is 6. The health of the player is 6.

Every turn when the health of the player was less than the maxHealth of the player for at least 1 turn:
	if the mannequin is not annoying and a random chance of 1 in 3 succeeds:
		increase the health of the player by 1;
		say "You've managed to fix yourself up a little --[if the health of the player is the maxHealth of the player]in fact, you'd say you're at peak health![else] [one of]but the pain still makes you a little nauseous.[or]but you're still in a bit of pain.[at random]".

RemovingHealth from is an action applying to one thing. 

Carry out removingHealth from the player:
	decrease the health of the player by 1;
	if the health of the player is less than 1:
		say "Badly injured and taking the brunt of the force, you black out...";
		end the story;
	otherwise:
		say "You take some damage -- [one of]you're pretty sure that sprained something.[or]now there's a nasty-looking gash on your knee.[or]a bruise forms just below your hairline.[or]your arm is no longer in the best shape.[in random order][first time]You should probably let that heal.[only]".

Diagnosing is an action applying to nothing.
Understand "diagnose", "check health", "health", "HP", "tend wounds" and "heal" as diagnosing.

Carry out diagnosing:
	let painVal be the maxHealth of the player minus the health of the player;
	now painVal is painVal times ten;
	now painVal is painVal divided by the maxHealth of the player;
	say "You'd rate your pain at a [painVal in words], but you can ride it out.".



Volume - The Bedroom

Book - Chairs

A chair is a kind of supporter that is enterable. A chair is not fixed in place.
Understand "chairs" as chairs.

Part - Standard-Issue

A SIchair is a kind of chair. The printed name of a SIchair is "standard-issue chair".
Understand "standard chair" and "standard issue chair" as SIchair.

A maroon chair is a SIchair. "A [if 4 chairLegs are part of the maroon chair]standard-issue[otherwise if no chairLegs are part of the maroon chair]legless[otherwise][number of chairLegs held by the maroon chair in words]-legged[end if] maroon chair sits awkwardly in the corner.".
The printed name of the maroon chair is "maroon chair".
The description of the maroon chair is "A plain, stackable maroon chair of the sort you might find in a school or DMV. [if 4 chairLegs are part of the maroon chair]It has four shiny metal legs, each of which can be detached with a bit of effort.[otherwise if 3 chairLegs are part of the maroon chair]It's missing a leg, but the other three seem in pristine condition.[otherwise if 2 chairLegs are part of the maroon chair]Its legs can be detached with a bit of effort. It's already lost a couple.[otherwise if 1 chairLeg is part of the maroon chair]It seems to be on its last leg...[otherwise]Its lack of legs is a little awkward.[end if]".

Section - Actions

Check taking a SIchair (called target):
	if the player does not hold the target:
		if the player holds a SIchair (called a foob):
			if the foob encloses an SIchair:
				say "That would be way too many chairs. Maybe you should take a few trips." instead;
			otherwise:
				say "It would be too hard to carry more than one, especially when they're unstacked like this." instead;
		if the target encloses more than one SIchair:
			say "It'd be too heavy." instead.

Check entering a SIchair:
	let legNum be the number of chairLegs that are part of the maroon chair;
	if legNum is less than 4 and legNum is greater than 0:
		say "You get onto the [number of chairLegs that are part of the maroon chair]-legged chair. Despite your best attempts, you end up toppling to the floor.";
		try removingHealth from the player instead.
		
Check putting a SIchair (called the target) on a SIchair (called the parent):
	if the parent encloses a SIchair (called the child):
		if the child is the target:
			say "[The target] is already there." instead;
		otherwise:
			say "[The child] is in the way." instead.
			
Does the player mean putting a SIchair (called the target) on a SIchair (called the parent):
	if the parent encloses a SIchair, it is very unlikely;
	if the parent is the target, it is very unlikely.

Chapter - Legs

A chairLeg is a kind of container. ChairLegs are usually open and unopenable.
The printed name of a chairLeg is "chair leg".
The printed plural name of a chairLeg is "chair legs".
4 chairLegs are part of every SIchair.
Understand "chair leg" and "leg" as chairLeg.
Understand "chair legs" and "legs" as chairLegs.

Section - Actions

Instead of inserting something into a chairLeg:
	say "What would be the point of that?".

Does the player mean taking a chairLeg (called target) when the target encloses something:
	if the target is enclosed by the player:
		it is very unlikely;
	otherwise:
		it is likely.

Before listing contents: group chairLegs together. 

Rule for grouping together a chairLeg (called target): 
	let source be the holder of the target; 
	say "[number of chairLegs held by the source in words] leg[s] off a standard chair.".
	
Understand "detach [a chairLeg]" or "unfasten [a chairLeg]" or "remove [a chairLeg]" or "unscrew [a chairLeg]" or "take [a chairLeg]" as taking.
Instead of taking a chairLeg (called a child) when the child is part of a SIchair (called a parent):
	if the player is on the parent:
		say "You don't think that's a very good idea.";
	otherwise:
		say "You carefully unscrew the leg and tuck it under one arm.";
		now the player carries the child.

Understand "attach [a chairLeg] to [something]" or "reattach [a chairLeg] to [something]" or "screw [a chairLeg] to [something]" or  "put [a chairLeg] back on [a SIchair]" or "put  [a chairLeg] on [a SIchair]" as tying it to.
Instead of tying a chairLeg (called a child) to something (called a parent):
	if the parent is not a SIchair:
		say "You don't see anywhere you could attach it." instead;
	otherwise:
		let legNum be the number of chairLegs that are part of the parent;
		if legNum is greater than 3:
			say "You don't see anywhere you could attach it." instead;
		otherwise if the player is on the parent:
			say "You might try getting up first." instead;
		otherwise:
			say "You bolt the leg back into place.";
			now the child is part of the parent.
	

	
Book - Windows & Doors

Part - Windows

A window is a kind of door that is fixed in place. A window can be missing. A window is usually closed and not missing.
Understand "window" as a window.

Instead of doing anything to a window (called a target) when the target is missing:
	say "You can't see any such thing.".
	
Does the player mean doing something to a window (called a target) when the target is missing: it is very unlikely.

The westRedDoor is a window that is missing, open, and undescribed. "To the north is a single red door leading back to the hallway.".
The printed name of the westRedDoor is "red door".
Understand "door" and "red door" as westRedDoor.
The westRedDoor is north of the bedroom. Through the westRedDoor is the hallway.

Chapter - Shy Windows

The shyWindow is a window. "There aren't any doors in or out, but there's [a shyWindow] to the east.".
The printed name of the shyWindow is "window".
		
Section - Actions

People can be notLooking. People are not notLooking.

Before examining a shyWindow when the player is notLooking:
	now the player is not notLooking.

Instead of doing anything to the shyWindow when the player is not notLooking:
	if the current action is lookingAway from:
		try lookingAway;
	if the current action is backwardsing:
		say "(first looking away from [the shyWindow])";
		try lookingAway;
		try entering the shyWindow;
	otherwise:
		say "You could have sworn there was just [a shyWindow] here...".

ClosingEyes is an action applying to nothing.
Understand "close eyes" and "cover eyes" as ClosingEyes.
Carry out ClosingEyes:
	silently try waiting;
	say "Not the most graceful of people, you can only fumble about in the dark for a few minutes before opening your eyes again. You've gotten nowhere. [if the player holds the piece of paper and the hallway is unvisited]Maybe it'd be a better idea to just look [italic type]away[roman type] from [the shyWindow] as you go through...[end if] ".

LookingAway is an action applying to nothing.
Understand "don't look" and "look away" as LookingAway.
Check lookingAway:
	if the player is notLooking:
		say "The only thing in your view is the wall, bucko." instead;
	if the shyWindow is missing:
		say "Doesn't seem like the best option, here." instead.	
Carry out lookingAway:
	say "You stare pointedly at the other side of the room. [if the shyWindow is visible][The shyWindow] seems relieved.[end if]";
	now the player is notLooking.

LookingAway from is an action applying to one thing.
Understand "look away from [the shyWindow]", "look away from [the shyWindow]", "do not look at [the shyWindow]", and "don't look at [the shyWindow]" as LookingAway from.
Carry out lookingAway from something:
	try lookingAway instead.
	
Backwardsing is an action applying to one thing.
Understand "go backwards through [something]", "go through [something] backwards", "enter [something] backwards", "walk through [something] backwards", "walk through [something] backwards" as backwardsing.
Carry out backwardsing a shyWindow:
	try lookingAway;
	try entering the shyWindow.

Instead of opening a shyWindow when the player is notLooking:
	say "Watching the far wall, you back up to [the shyWindow] and tug at the pane. Your arms don't quite bend that way, but you manage to slide it open eventually.";
	now the shyWindow is open.

Carry out going through a shyWindow:
	now the shyWindow is undescribed;
	now the shyWindow is Missing;
	now the westRedDoor is not missing;
	now the westRedDoor is described;
	say "Carefully, you step backwards through [the shyWindow]. It's very a stressful moment for you both. But with some manuvering, you fall ungracefully into the next room.[line break]";
	now the player is not notLooking.
	

Part - Doors

Chapter - Weird Doors

The red door is a weird door. "There's a single red door leading to[if the spare room is visited] a strange multitude of places[otherwise] what you're reasonably sure is the kitchen[end if].".
The red door is open and W.
The description of the red door is "A simple -- but somewhat pompous -- red door. Despite its regal nature, it seems indecisive. It's currently [if the red door is N]north[otherwise if the red door is S]south[otherwise if the red door is W]west[otherwise if the red door is E]east[end if].".
Every turn:
	if the red door is N:
		now the red door is S;
	otherwise if the red door is S:
		now the red door is W;
	otherwise if the red door is W:
		now the red door is E;
	otherwise if the red door is E:
		now the red door is N.
		
Section - Actions
	
Before going when the location is the hallway:
	say "You make a lunge for the doorway...";
	if the player has been in the hallway for only one turn:
		say "...But end up with a face full of wall." instead.

Instead of going north when the location is the hallway:
	if the giant worm is violent:
		say "...But end up with a face full of worm slime. The worm fills the entire doorway." instead;
	otherwise if the red door is N:
		say "...And make it into [the kitchen].";
		now the player is in the kitchen;
	otherwise:
		say "...But end up with a face full of wall. The door seems to be [if the red door is N]north[otherwise if the red door is S]south[otherwise if the red door is W]west[otherwise if the red door is E]east[end if] now." instead.
Instead of going south when the location is the hallway:
	if the red door is S:
		if the giant worm is stuck:
			say "...And make it into [the living room].";
			now the player is in the living room;
		otherwise:
			say "...But end up with a face full of brick. Looks like south doesn't lead anywhere." instead;
	otherwise:
		say "...But end up with a face full of wall. The door seems to be [if the red door is N]north[otherwise if the red door is S]south[otherwise if the red door is W]west[otherwise if the red door is E]east[end if] now." instead;
Instead of going east when the location is the hallway:
	if the red door is E:
		if the giant worm is patient:
			say "...But end up with a face full of brick. Looks like east doesn't lead anywhere." instead;
		if the giant worm is stuck:
			say "...But end up with a face full of worm. Its slimy, stuck tail takes up the entire doorway." instead;
		otherwise:
			say "...And make it into [the spare room].";
			now the player is in the spare room;
	otherwise:
		say "...But end up with a face full of wall. The door seems to be [if the red door is N]north[otherwise if the red door is S]south[otherwise if the red door is W]west[otherwise if the red door is E]east[end if] now." instead;
Instead of going west when the location is the hallway:
	if the red door is W:
		if the giant worm is patient:
			say "...But end up with a face full of brick. Looks like west doesn't lead anywhere." instead;
		otherwise:
			say "...And make it into [the bedroom].";
			now the player is in the bedroom;
	otherwise:
		say "...But end up with a face full of wall. The door seems to be [if the red door is N]north[otherwise if the red door is S]south[otherwise if the red door is W]west[otherwise if the red door is E]east[end if] now." instead.
	
Before doing something to the red door when the location is the hallway:
	unless the current action is examining:
		say "You try, but it disappears[one of][or] again[stopping] before you can reach it. [if the current action is entering]...You should probably try to figure out where it will be, first.[end if]" instead.

Book - Other Things

The piece of paper is a thing. Understand "note" as piece of paper.
The description of the piece of paper is "The paper reads: 'Sorry about the window. It gets awfully shy when people stare at it. Maybe it'd be best if you just don't look...'".

When play begins:
	repeat with target running through chairLegs:
		if the target is part of the maroon chair:
			now the piece of paper is inside the target;
			break;
		otherwise:
			next.

The tiled floor is a floor.
The description of the tiled floor is  "The design points in each of the cardinal directions: [if the giant worm is patient]south, east, and west are tiled in black onyx while north is a lighter granite. [otherwise if the giant worm is violent]south is tiled in black onyx while north, east, and west are a lighter granite.[otherwise]north, south, east, and west are all tiled in white granite.[end if]".
Understand "design" as tiled floor.

Section - Rooms

The Bedroom is a room. "[one of]You're pretty sure this used to be your bedroom... This must be some kind of weird dream.[or]You are in the bedroom.[stopping]".
There is a maroon chair in the bedroom.
The shyWindow is east of the bedroom. Through the shyWindow is the hallway.

The Hallway is a room. "This was once your lengthy, rectangular hallway. But now it's some strange, circular room with a tiled design on the floor.[first time][line break][line break][The shyWindow] appears to have fled.[only]".
The tiled floor is in the hallway.
The red door is north of the hallway.


Part 2 - The Black Box

Section - Objects

The black box is a thing. A red button is part of the black box. The black box is fixed in place.
The printed name of the black box is "innocuous black box".
Understand "device" and "box" as the black box.
The description of the box is "It is suspiciously casual. On the top is a large, shiny, unassuming red button.".

The giant worm is a neuter person. The giant worm can be patient, violent, stuck, or unstuck. The giant worm is patient.
Understand "worm" and "monster" as the giant worm.
The description of the giant worm is "Eyeless and slimy, the beast fills nearly the entire room. You're not sure how you didn't hear it erupt through the floor.".

The highWindow is a door. "You can see a small [highWindow], but it's too high to reach.". The printed name of the highWindow is "hopper window".
Understand "window" as highWindow.
The description of the highWindow is "You could probably squeeze your way through this if you could reach it... When you stand on your tiptoes, you catch a glimpse of a pointy-hatted figure.".

The real red door is a door that is open. "There's a single red door to the south, leading back to the hallway.".
The printed name of the real red door is "red door". Through the real red door is the hallway.
The description of the real red door is "A simple -- but somewhat pompous -- red door. This side seems decidedly more stable. It is firmly south.".

The kitchenCounter is a supporter. The kitchenCounter is scenery. The printed name of the kitchenCounter is "kitchen counter".
Understand "counter", "table", "kitchen table", and "kitchen counter" as kitchenCounter.

Section - Actions

Check going through the highWindow:
	if the player is on a SIchair (called cL1):
		if cL1 is on a SIchair (called cL2):
			if cL2 is on a SIchair (called cL3):
				if cL3 is on a SIchair (called cL4):
					say "Carefully balancing on all the chairs, you manage to reach the window!";
					now the player is in Outside the House instead;
				otherwise:
					say "You carefully balance on the chairs, but still can't quite reach the window." instead;
			otherwise:
				say "You carefully balance on the chairs, but still can't quite reach the window." instead;
		otherwise:
			say "You carefully balance on the chair, but still can't quite reach the window." instead;
	otherwise:
		say "You can't reach it." instead.
		
Check entering a chair (called the child) when something (called the parent) encloses the child:
	if the parent is not enterable:
		say "That idea seems equally bad and useless. Remove it from [the parent] first." instead.

Redescattering is an action applying to one thing.
Understand "use [the black box]", "activate [the black box]", "press the button on [the black box]", "press [the black box]", "press [the button]" as redescattering.

Instead of redescattering the button:
	try redescattering the black box.

Carry out redescattering the black box:
	say "[italic type]Click.[roman type]";
	if the location is the kitchen, now the giant worm is in the kitchen.

Every turn while the giant worm is patient:
	if the giant worm is in the kitchen and the giant worm has been in the kitchen for at least 1 turn:
		say "[The giant worm] [one of]waits patiently for you to notice it.[or]shifts nervously. It hopes it isn't being a bother.[or]awkwardly sinks back into the floor a little bit. It worries that you might have left without acknowledging it.[or]worries that it may have offended you somehow.[or]waits nervously for you to notice it.[stopping]".

Noticing is an action applying to one thing.
Understand "notice [something]" or "acknowledge [something]" as noticing.

Carry out noticing:
	if the noun is the giant worm and the giant worm is patient:
		say "[The giant worm] is blind, and is uncertain that you have noticed it. Maybe a slight tap?";
	otherwise:
		say "You did your best to notice [the noun]. Pleased with yourself?".
	
Instead of touching the giant worm when the giant worm is patient: say "[The giant worm] is still uncertain that you have noticed it. It's possible that you've only brushed up against it by accident. Maybe you should try talking to it.".

Instead of telling the giant worm about something:
	if the giant worm is patient or the giant worm is violent:
		say "[if the giant worm is not violent][The giant worm] is pleased that you acknowledged it.[end if] It promptly begins to gnash its teeth at you. The giant worm has [italic type]many[roman type] teeth.";
		now the giant worm is violent;
	if the giant worm is stuck:
		say "It's too upset to hear you.";
	otherwise:
		say "Your booming human voice is too low for its tiny worm eardrums to hear.";
	
Instead of asking the giant worm about something:
	if the giant worm is not stuck:
		say "[if the giant worm is not violent][The giant worm] is pleased that you acknowledged it. It promptly begins to gnash[otherwise]It gnashes[end if] its teeth viciously at you in response. The giant worm has [italic type]many[roman type] teeth.";
		now the giant worm is violent;
	else:
		say "It's too upset to hear you.".
	
Every turn while the giant worm is violent:	
	if the giant worm has been violent for at least 1 turn:
		if the giant worm is visible:
			say "[one of]You duck out of the way as the worm takes a chomp at you.[or]The worm headbutts you gently.[or]The worm slices at you with its razor teeth, but you dodge...mostly.[or]The worm swings its head at you like a wrecking ball. You slam into the wall.[in random order]";
			try removingHealth from the player;
		otherwise:
			say "[The giant worm] [one of]tries to follow, but gets stuck in the door[or]manages to squeeze through its current door, but gets stuck again in the next one[stopping]. It wiggles through slowly and carefully, so as not to hurt the frame (but makes sure to snap viciously at you anyway).";
			now the giant worm is in the location.
			
Instead of going west in the spare room while the giant worm is violent:
	if the giant worm is violent:
		say "You end up with a face full of worm slime. The worm fills the entire doorway." instead.

Section - Rooms

The Kitchen is a room. "[one of]Well, at least the kitchen looks mildly familiar.[or]You are in the kitchen.[stopping] [if something is on top of the kitchenCounter]On the counter [is-are a list of things on top of the kitchenCounter].[end if][if the giant worm has been in the kitchen]The worm has left the floor in splinters.[end if]".
There is a kitchenCounter in the kitchen.
On top of the kitchenCounter is a black box.
The real red door is south of the kitchen. Through the real red door is the hallway.
The highWindow is east of the kitchen. Through the highWindow is Outside the House.

The spare room is a room. "This room is pretty dim and empty. There [is-are a list of SIchairs in the spare room] huddled in the corner.".
There are a green chair, a blue chair, and a yellow chair in the spare room.

Before going south in the spare room the first time:
	say "you slam the door shut and lock it behind you.";
	now the giant worm is stuck;
	now the heavy door is locked;
	now the player is in the living room instead.
	
After deciding the scope of the player while the location is the hallway:
	if the giant worm is stuck, place the giant worm in scope.
	
After deciding the scope of the mannequin while the location is the hallway:
	if the giant worm is stuck, place the giant worm in scope.

	
	
		

Part 3 - The Mannequin

Section - Objects

The heavy door is a door. "There's a large decorative door to the [if the location is the spare room]south[otherwise]east[end if][if the giant worm is violent] that you're pretty sure could hold back the worm[end if][if the heavy door is locked]. It's locked tight[end if].".
The heavy door is south of the spare room and east of the living room.

Locking is an action applying to one touchable thing.
Understand "lock [the heavy door]" as locking.
Instead of locking the heavy door when the heavy door is unlocked:
	say "You lock [the heavy door]";
	now the heavy door is locked.
	
Unlocking is an action applying to one touchable thing.

Understand "unlock [the heavy door]" as unlocking.

Instead of unlocking the heavy door:
	if the giant worm is unstuck and the location is the spare room:
		say "You manage to unlock [the heavy door]";
		now the heavy door is unlocked;
	otherwise:
		say "The lock is stuck!".
	
The blue chair is a SIchair. The printed name of the blue chair is "blue chair".
The green chair is a SIchair. The printed name of the green chair is "green chair".
The yellow chair is a SIchair. The printed name of the yellow chair is "yellow chair".

A knothole is a thing. The description of the knothole is "Nothing inside. You're also slightly tempted to stick your finger through it."

Chapter - The Mannequin

The mannequin is a neuter person. "[if the mannequin is not following][A mannequin] sits in the corner of the room.[otherwise][one of][The mannequin] slouches, bored.[or][The mannequin] examines your [one of]hair[or]nose[or]jacket[at random] with interest.[or][The mannequin] sways to some nonexistent tune.[or][The mannequin] is watching dust particles.[or][The mannequin] idly wonders what its pet worm is up to.[at random]".

The mannequin can be annoying. The mannequin can be following.
Understand "Elswick" as the mannequin when the mannequin is proper-named.
	The description of the mannequin is "There's a knothole in the wood where its eye should be."
	The knothole is part of the mannequin.

Section - AI

Every turn when the mannequin is following:
	if the location of the mannequin is not the location of the player:
		say "[The mannequin] follows.";
		now the mannequin is in the location;
	if the mannequin is following for the first turn:
		now the mannequin is annoying.


Every turn when the mannequin is annoying:
	if the mannequin is annoying for the first turn:
		say "After a few moments of deliberation, the mannequin opts to communicate by poking at your head.[paragraph break]Poke pokepoke poke poke poke, poke pokepoke poke poke poke poke pokepokepoke...";
	if the mannequin is annoying for at least two turns, say "The mannequin continues to prod uselessly at you.[paragraph break][one of]Pokepokepoke poke poke poke pokepoke poke pokepoke poke pokepokepoke poke pokepoke poke poke poke pokepoke...[or]Poke poke poke poke poke pokepoke poke pokepokepoke poke...[or]Poke pokepoke poke poke poke poke poke pokepoke poke...[or]Pokepoke poke poke, poke pokepoke pokepoke pokepokepoke pokepoke poke pokepoke poke pokepoke poke poke pokepoke...[or]Pokepokepoke poke poke...[stopping]";
	if the mannequin is annoying for the fifth turn:
		say "[line break]You think you're developing a bruise. Maybe you should tell it to stop.";
		decrease the health of the player by one;
	if the mannequin is annoying for at least six turns:
		if a random chance of 1 in 3 succeeds:
			say "[line break]Incredibly, you actually take some damage.";
			decrease the health of the player by one;
			if the health of the player is less than 1:
				say "[line break]You managed to be poked to death. Congratulations.";
				end the story.
				
Section - Talking

Table of Conversation Topics
topic	number
"exit" or "leaving" or "getting out" or  "how to get out" or  "escaping" or  "escape" 	0
"[the southRedDoor]" or "unlock [the southRedDoor]" or "open [the southRedDoor]"	0
"stop" or "poking" or "why" or "stop poking" or "stop poking me"	1
"moving [the giant worm]" or "[the giant worm]" or "removing [the giant worm]"	2



Instead of telling the mannequin about something for the first time:
	say "The mannequin shifts. Its arms seem to move independently of...[italic type]themselves[roman type]. That is, although they stay stiffly crossed behind the mannequin's back, they also gesture -- almost like a hologram -- as it tries to speak...[paragraph break]...Unfortunately, the mannequin does not seem to have a mouth. It pauses to consider this fact.";
	now the mannequin is following.

Instead of telling the mannequin about something when the mannequin is visible:
	if topic understood is a topic listed in the Table of Conversation Topics: 
		if the number entry is 0 and the location is the living room and the mannequin is not annoying:
			if the southRedDoor is locked:
				say "[The mannequin] considers. It looks at the door. It rolls up its sleeves. With all its energy, it [italic type]dramatically wiggles its fingers...[roman type][paragraph break]...Nothing. The mannequin seems disappointed. Melancholy, even. It'll [italic type]never[roman type] be a real wizard.[paragraph break]With a disappointed slouch and a little patting around at its pockets, the mannequin produces a key and unlocks the door for you.";
				now the southRedDoor is unlocked;
			otherwise:
				say "[The mannequin] throws a testy gesture toward the red door, which is already unlocked.";
		otherwise if the number entry is 1 and the mannequin is annoying:
			say "Finally, you snap. You swat the mannequin's hand and tell it to stop.";
			now the mannequin is not annoying;
			say "[The mannequin] reluctantly withdraws and respects your personal space.";
		otherwise if the number entry is 2 and the location is the hallway and the giant worm is stuck:
			say "[The mannequin] waves its hands at the worm. Nothing happens. Then it waves them again. For a dreadful second, nothing happens again.[line break]But then something happens: [the giant worm] suddenly shrinks to the approximate size of the coffee cup.[paragraph break]The mannequin picks it up, smooches its tiny worm head, and puts it in its pocket.";
			now the giant worm is unstuck;
			now the mannequin carries the giant worm;
		otherwise:
			if the mannequin is annoying:
				say "You awkwardly try to make small talk, but are too distracted to think of any topics...[paragraph break]";
				if the mannequin has been annoying for at least three turns:
					try telling the mannequin about "stop";
				otherwise:
					say "(Well, it's not worth getting mad at the poor guy yet...)";
			otherwise if the mannequin is following:
				say "[one of][The mannequin] nods in a similar fashion to the way people nod when they have no clue what you just said.[or][The mannequin] was distracted by a light breeze.[or][The mannequin] inspects the grain of its hands.[or][The mannequin] seems more interested in the composition of your hair than what you have to say.[at random]";
	otherwise:
		if the mannequin is annoying:
			say "You awkwardly try to make small talk, but are too distracted to think of any topics...[paragraph break]";
			if the mannequin has been annoying for at least three turns:
				try telling the mannequin about "stop";
			otherwise:
				say "(Well, it's not worth getting mad at the poor guy yet...)";
		otherwise if the mannequin is following:
			say "[one of][The mannequin] nods in a similar fashion to the way people nod when they have no clue what you just said.[or][The mannequin] was distracted by a light breeze.[or][The mannequin] inspects the grain of its hands.[or][The mannequin] seems more interested in the composition of your hair than what you have to say.[at random]".

Section - Give and Take

Does the player mean asking the mannequin for something not enclosed by the mannequin: it is very unlikely.

Instead of asking the mannequin for a SIchair (called the target) when the mannequin carries the target:
	say "The mannequin drops the [if the mannequin encloses more than one SIchair]stack of chairs[otherwise]chair[end if] on the floor, relieved.";
	now the target is in the location.

Instead of giving something (called the target) to the mannequin:
	if the mannequin is following:
		if the target is a piece of paper:
			say "[The mannequin] examines the piece of paper with enthusiasm -- waving it excitedly at you as though the whole business unscrewing chair legs had been [italic type]its[roman type] genius idea -- before pocketing it.";
			now the mannequin holds the piece of paper;
		otherwise if the target is a SIchair:
			if the target encloses more than one SIchair or the mannequin holds a SIchair:
				say "[The mannequin] shakes its head; it doesn't think it can carry that many chairs.";
			otherwise:
				say "[The mannequin] picks up the [if the noun encloses one SIchair]stack of chairs[otherwise]chair[end if].";
				now the mannequin holds the target;
		otherwise:
			say "[The mannequin] refuses to take [the noun]; that'd just be bad manners.";
	otherwise:
		say "[The mannequin] refuses to take [the noun]; that'd just be bad manners.".





Understand "prod [something]", "tap [something]", "pat [something]", and "poke [something]" as touching.

Before doing something to the knothole:
	unless the current action is examining:
		say "The mannequin leans away from you, offended that you would even consider such a thing." instead.

Report pushing the mannequin:
	if the mannequin is following:
		say "[The mannequin] stumbles back a couple feet.";
	otherwise:
		say "[The mannequin] topples over. It looks a little offended, but mostly surprised.".

Instead of touching the mannequin:
	say "The wood is well-varnished and superbly polished. Perhaps less so, now that you've touched it.".

Understand "hugging [the mannequin]" as kissing.

Instead of kissing the mannequin:
	say "[The mannequin] abashedly hides its face in its hands.".

Instead of listening to the mannequin:
	say "Unfortunately, [the mannequin] still cannot speak.".

Instead of showing something to the mannequin:
	say "[The mannequin] takes a moment to appreciate your [noun].".

Instead of throwing something at the mannequin:
	say "[The mannequin] swiftly ducks. [The noun] lands with a clunk on the floor.";
	silently try dropping the noun.
	
Instead of attacking the mannequin:
	say "You swing at the mannequin's wooden body, but nothing happens. The mannequin seems slightly offended.".
	
Instead of telling the mannequin about something:
	say "[one of]The mannequin nods in a similar fashion to the way people nod when they were not listening to a word of what you just said.[or]The mannequin was distracted by a light breeze.[or]The mannequin inspects the grain of its hands.[or]The mannequin seems more interested in the existance of your hair than what you have to say.[at random]"
	
The southRedDoor is a door that is closed and locked. "There's a single red door leading north to the hallway.".
The printed name of the southRedDoor is "red door". Understand "door" and "red door" as the southRedDoor.

The eastRedDoor is a door that is open. "There's a single red door leading west to the hallway.".
The printed name of the eastRedDoor is "red door". Understand "door" and "red door" as the eastRedDoor.


Section - Rooms

The Living Room is a room. The mannequin is here.
The southRedDoor is north of the living room. Through the southRedDoor is the hallway.

The eastRedDoor is west of the spare room. Through the eastRedDoor is the hallway.







Part 4 - The Purple Robe Society

The wizard is a person. "A wizard stands off to the side[one of], kicking idly at the dirt.[or], trying to look like he knows what he's doing.[or]. He shuffles his feet.[at random]". The wizard holds a thing called a staff. The wizard can be normal, accusing, or apologetic. The wizard is normal.

Before doing something to the wizard while the wizard is normal:
	if the mannequin is not proper-named:
		now the printed name of the mannequin is "Elswick";
		now the mannequin is proper-named;
		say "The wizard interrupts you: 'Is that Elswick?' he stares at the mannequin. Elswick waves cheerfully.[paragraph break]'Oh dear. You're a-- a-- what do you call it?'[paragraph break]It shrugs.[paragraph break]'A...golem?'[paragraph break]Elswick--[paragraph break]'Yes, yes, a golem. Well, well, haven't you gotten yourself into quite a situation?'" instead;
	if the mannequin has been proper-named:
		now the wizard is accusing;
		say "The wizard interrupts you: 'Aha? And you've summoned a demon?' he asks the mannequin, prodding you with his staff.[paragraph break]Elswick stiffens a little and shakes its head.[paragraph break]'And you've turned you into wood have you, demon?'" instead.
		
Before doing anything while the wizard is accusing:
	if the wizard is accusing for the first turn:
		say "The wizard interrupts you: 'Well, demon? What do you have to say for yourself?'" instead;
	if the wizard is accusing for the second turn:
		say "The wizard interrupts before you can even take a breath: 'Nothing to say for yourself, hmm? Just as I thought! Black magic to the core!!'" instead;
	if the wizard is accusing for the third turn:
		say "The wizard interrupts, pointing his staff your way. 'You shall be banished back to whence you came!!'[paragraph break]Elswick stands in the background, embarrassed and apologetic." instead;
	if the wizard is accusing for the fourth turn:
		say "The wizard wiggles the staff a little, muttering to himself, 'Why isn't it working?'[paragraph break]Elswick taps him on the shoulder and shakes its head. At first the wizard is confused, but after a few minutes Elswick manages to convey to him that you are not a demon.[paragraph break]'Oh. Oh my. I am very sorry about that, sir-and-or-ma'am,' the wizard says.";
		now the wizard is apologetic instead.
		
Table of Wizard Topics
topic	number
"house" or "the house" or "home" or "the home" or "what happened"	0
"what happened to my house" or "what happened to my home"	0
"him" or "himself"	1
"elswick" or "mannequin" or "golem"	2
"fixing it" or "fixing the house" or "repairing it" or "repairing the house"	0
"the purple robe society" or "purple robe society" or "wizard society" or "society"	3


Instead of telling the wizard about something when the wizard is visible:
	if topic understood is a topic listed in the Table of Wizard Topics: 
		if the number entry is 0:
			say "[one of]You ask the wizard about what happened to your house.[paragraph break]'Don't blame me,' the wizard snaps. 'The Purple Robe Society chooses the spell-testing grounds.'[or]You ask the wizard about [italic type]what[roman type] happened to your house.[paragraph break]The wizard sighs. 'Well, my apprentice and I were testing a defizzler-- A sort of... Physics-scrambling button... That *ahem* overheated and fused itself to your kitchen counter...'[or]You ask the wizard about how to fix your house.[paragraph break]'Well, you'd have to bring that up with the Purple Robe Society! I wouldn't know anything about that.'[stopping]";
		if the number entry is 1:
			say "[one of]You ask the wizard about himself.[paragraph break]'Me?' the wizard grins. 'Well! I'm only the wiset and best wizard of the Purple Robe Society!'[or]You ask the wizard about himself.[paragraph break]'Oh yes! I've invented the googledopper, the defizzler, the tompwhopter, the...' He goes on for a little while, but you've stopped listening -- you're pretty sure he's making these names up.[stopping]";
		if the number entry is 2:
			say "[one of]You ask the wizard about Elswick.[paragraph break]'Elswick?' the wizard asks. 'Elswick is my apprentice. Er... golem, now, it looks like...? Oh dear...'[or]You ask whether Elswick will be okay.[paragraph break]The wizard shrugs. Elswick just sort of sways cheerfully, unbothered by its current mannequin state.[stopping]";
		if the number entry is 3:
			say "[one of]You ask the wizard about the Purple Robe Society.[paragraph break]'Oh,' says the wizard, 'well, it's a very prestegious society of wizards, of course!'[paragraph break]...You've never heard of it.[or]You ask where you can find the Purple Robe Society.[paragraph break]The wizard shrugs vaguely. 'You know, I think the defizzler may have ruined it... Along with the end of your game...[stopping]";
	otherwise:
		say "The wizard didn't quite understand that.".
		
Section - Rooms

Outside the House is a room. "You're now on your lawn. From outside the house, you can now see the monstrosity it has become. Your chimney must have been swapped with your toilet, and you're pretty sure whatever is spread across the porch used to be your [petunias]...[first time][paragraph break]You're not sure how to feel about this. Angry? Confused? You briefly wonder if the process is reversible. You're certain the insurance won't cover it, after all...[only]".
The wizard is in Outside the House.
The petunias are a fixed in place thing in Outside the House. The description of the petunias is "Ruined...".
Understand "house" as petunias.

Part 5 - THE HALL OF KINGS

Section - Objects

A thing can be behind the receptionist's desk.

A receptionist's desk is a supporter that is fixed in place.

The receptionist is a person. Understand "desk clerk" as the receptionist.

The television is a undescribed device that is fixed in place.

Section - Actions

Report telling the receptionist about something:
	say "[one of][The receptionist] pops her gum with pointed indifference.[or]You thought she was paying attention, but she was actually staring at the [television] behind you.[or][The receptionist] turns her headphones up a few notches and continues to surf the web.[or]The receptionist smiles -- at a cute cat picture that she has set as her desktop.[at random]".


Understand "turn on [device]" as switching on. 
Understand "turn off [device]" as switching off.
Instead of doing something to the television:
	if the current action is switching on:
		say "A large slab of plastic blocks the control panel. You're not sure you could reach it anyway.";
	if the current action is switching off:
		say "A large slab of plastic blocks the control panel. You're not sure you could reach it anyway.";
	otherwise:
		say "The television is too high to reach.";

Section - Rooms

THE HALL OF KINGS is a room. "You are in the HALL OF KINGS. There is a [receptionist's desk] and a [receptionist] here, along with -- god, not [italic type]more[roman type] standard issue chairs. It looks suspiciously like a DMV, but a bit smaller and less busy. Maybe more like a doctor's office."

There are ten chairs here.
