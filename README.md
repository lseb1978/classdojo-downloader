# PowerShell Classdojo-Downloader
Classdojo Photos and Videos Downloader in PowerShell

![Classdojo.com](https://www.classdojo.com/static/8ceb13c1cedc11f744c9077b520d0c79/39223/classdojo_logo_176%402x.png)

[Visit Classdojo.com website.](https://www.classdojo.com)

**What’s ClassDojo?**

ClassDojo is a global community of 50M+ teachers and families who come together 
to share kids’ most important learning moments in school and at home—through 
photos, videos, messages & more.

**Purpose**

***This is a script that fetches Classdojo images and videos since they don't offer a feature to download them from your story feed.***

**Requirements**

    A classdojo.com account

**Usage**

I use API https://home.classdojo.com/api/storyFeed?includePrivate=true to list all photos and videos to download

sample of link to download image :

"https://images.classdojo.com/dojophotos/xxxxxxxxxxxxxxx/2022-06-30/xxxxxxxxxxxxxxxxxxxxxxx_xxxxxxxxxxxxxx.jpg"

I did not find the possibility to connect directly via powershell to the site, 
I use the values of the cookie's connection 

Sample : 
```
  $cookie.Name = "dojo_login.sid"
  $cookie.Domain = ".classdojo.com"
```
