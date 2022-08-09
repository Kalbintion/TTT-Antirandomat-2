# TTT-Antirandomat-2
Garry's Mod Trouble in Terrorist Town Traitor Weapon Anti-Randomat 2.0

*This is a spiritual successor to the Randomat's Traitor nemesis, the [Anti-Randomat](https://steamcommunity.com/sharedfiles/filedetails/?id=1917064838) originally developed by [aPythagorion](https://steamcommunity.com/id/bypythagyros)*

**Anti-Randomat 2.0** strives to include additional events, even those previously removed and configuration options across the board. All events in this add-on are able to be toggled on and off at will. For configuration of this add-on, please see the ConVar section below.

The primary reason this version came into being is from a group of friends I play with that hated the flipped screen but had no way to disabling *only* that event from the original add-on. In my time spent seeing to remove it I came across additional events that were commented out, most of them working, and went about just fully editing it to make everything configurable in the quickest-to-do way. Some time was then spent removing old dead code or references to things that seem to no longer exist.

# NEW ANTI-RANDOMAT EVENTS

**Tour De France**
Message: "Vivez toute l’intensité du Tour De France grâce au jeu officiel"<br />
Function: Everyone gets a bike and only a bike.<br />

**Forgotten Your Roles**
Message: "Did you forget who you were?"<br />
Function: All roles are re-randomized as if the round has just begun again.<br />

**Lost Your Wallet**
Message: "Whoops, you lost your wallet."<br />
Function: All roles lose their current credits, if they had any. Does not prohibit gaining additional credits from kills, or normal role behaviour.<br />

**Hail The King**
Message: "LONG LIVE THE KING!"<br />
Function: Detective gets set to 200 HP and model changed.<br />
Note: This event was deactivated in the original version.<br />

**Inverted Controls**
Message: "Did the Server get stuck on your Control Options?"<br />
Function: Forward is backwards and left is right. Controls are inverted as the name implies.<br />
Note: This event was deactivated in the original version.<br />

**Sidways Only**
Message: "Try to move forward!"<br />
Function: You cannot move backward/forwards. Only left and right.<br />
Note: This event was deactivated in the original version.<br />

# ORIGINAL ANTI-RANDOMAT EVENTS

**The Flash**
Message: "Normal Speed is bleakly, isn´t it?"<br />
Function: Increases Walk Speed to 200%.<br />

**300-Seconds-Timer**
Message: "300 Seconds left to Live!"<br />
Function: Sets a Timer of 300 Seconds. When the timer reaches 0 all players will die and the round will end.<br />

**Disguiser**
Message: "Do you think you can only recognize your fellow players by the model? We will see."<br />
Function: Removes all names from the players, so that everyone is disguised.<br />

**Random Damage**
Message: "Random Damage for Everyone!"<br />
Function: The message says everything: All players get a random amount of damage between 1 and 50HP.<br />

**Jumping**
Message: "Some of you jump up normally. The rest is unlucky!"<br />
Function: Some players will jump up normally, the other ones won´t be able to jump at all.<br />

**No Fall Damage**
Message: "No more Falldamage!"<br />
Function: No more Falldamage? Maybe it´s true, maybe it´s not.<br />

**Sudden-Death**
Message: "Everybody has only 1HP! Of course nobody can heal himself."<br />
Function: Everyone has only 1HP and Healing is deactivated.<br />

**No Explosion Damage**
Message: "No more Explosiondamage!"<br />
Function: No more Explosiondamage? Maybe it´s true, maybe it´s not.<br />

**Screen Flip**
Message: "What do you think happens when we flip the Screen? Let's try it out!"<br />
Function: Flips the screen upside down.<br />

**LSD Trip**
Message: "That was too much of the good Drugs...."<br />
Function: Every player´s screen looks like the player is high.<br />

**Remove the Detective**
Message: "Having a Detective is so a big Advantage for the Innocents, isn´t it?"<br />
Function: The player with the detective role becomes traitor or innocent.<br />

**Fall Collapse**
Message: "You fall collapse. Your View fades away..."<br />
Function: The screen fades black for a period of 10 seconds. During that time every player is teleported to a random spawnpoint.<br />

**Become Bugs Bunny**
Message: "Let´s turn you all into Bugs Bunny."<br />
Function: The Jump Power is 300% higher and fall damage is deactivated.<br />

# TO-DO
There are some additional features to this Anti-Randomat that I wish to implement, when time permits. Such as:

* Add additional events based on feedback
* Further extend the configuration options
* Incorporate ULX support & TTT2 F1 support depending on detected gamemode version and addon availability

* For now, only configuration support is via server console variables

* Fix some custom roles in TTT2 not closing their custom windows when Forgotten Your Roles event is picked

# Convars
Convars are variables that are introduced to allow server owners to customize the gameplay without changing the code.

To see full list of convars, [please visit here](https://gist.github.com/Kalbintion/db1cf1a7f2990d58f1c3ee8744ae8a09)

# FAQ
*Q:* I receive an error message! Please Help!
A: Read over the rest of the FAQ first, if your issue isn't resolve please post an issue on the [github issue tracker](https://github.com/Kalbintion/TTT-Antirandomat-2/issues) *OR* make a discussion post about it. Help by Comments will not be supported.

*Q:* I receive an error when we get Tour De France event!
A: This add-on relies on another add-on for this event. Make sure the server is subscribed to the [TTT - Traitor Bike](https://steamcommunity.com/sharedfiles/filedetails/?id=1858836015) add-on. To disable this event in case your server does not wish to subscribe to this addon, please set *antirandomat_bike 0* via server console or rcon.

*Q:* I have a different weapon to use for Tour De France!
A: This is answered in the ConVar section, but set the new weapon ID by using *antirandomat_bike_weaponid weapon_ttt_example* via server console or rcon. See console var information for further help.

*Q:* Role event doesn't close custom role's window(s)!
A: Known issue. On the to-do list. Unfortunately not a high priority to fix undecided, etc's custom window pop-ups from staying in the event they are unselected when this event happens.
