# discord-call

This is a script I threw together that allows players in Garry's Mod to call staff via Discord. If you want to use this on your own server, you MUST edit lua/autorun/config.lua. Generate a Discord Webhook and put it in there. The rest of the options are optional.

It should work by just adding this to your addons folder.

# NOTE

I haven't finished all the bugs yet. There are still quite a few ways things could go wrong (particularly if you set it up wrong), but it does still work. If you encounter any bugs, feel free to let me know by posting a bug report.

# For Developers

If you want to create your own menu (since I just used default derma cause it's easier), simply have a string that is sent to the networked string "CallDiscord".

Also, currently, I just send the data to a personal free webserver. If you want to host the web part of it for yourself, PM me and I'll get you the web file - @crossboy#6829.

Have fun.