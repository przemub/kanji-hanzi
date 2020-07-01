kanji-hanzi
===========

**An instance of this website runs at https://prem.moe/kanji-hanzi - go there if you want to try!**

A simple website written in Ruby using Sinatra that renders a character you input using different fonts (in this case from PRC, Taiwan, and Japan).

Installation
============

If you have Docker it's:
```bash
docker build -t kanji-hanzi .
docker run -it -p 80:4567 kanji-hanzi
```

If not, install requirements from `Gemlock` and run `ruby main.rb`.

Linguistic and technical background
===================================

Systems using Chinese characters are called hanzi, kanji, or hancha, depending on the language talked about. Moreover, People's Republic of China ordered simplification of them, leading to systems called Traditional and Simplified

It's often said that kanji used by Japanese are similar to Traditional Chinese characters but it's only kind of true &ndash; Japanese has also undergone <a href="https://en.wikipedia.org/wiki/Shinjitai">simplification</a>, albeit much less extensive. More confusingly, some Chinese characters (more specifically <a href="https://en.wikipedia.org/wiki/Radical_(Chinese_characters)">radicals</a>, that is components of characters) are the same between Traditional and Simplified Chinese but different in Japanese (<a href="?character=糸">糸</a>). Some others are the same in Simplified and Japanese (<a href="?character=道">道</a>) while the others look different in all three (<a href="?character=雇">雇</a>)!

To add to the confusion, your computer, smartphone or even dumbphone stores them <em>all the same</em>! The only difference being the font used to render them. (That caused a lot of <a href="https://en.wikipedia.org/wiki/Han_unification#Rationale_and_controversy">shitstorm</a> back in the day.)

And since our smartphones are not so smart, learners of Japanese (and probably the other languages? let me know) go through three stages: 1) how come my phone dictionary/movie player/browser displays these characters weird; 2) fighting with the device to change the font; 3) cursing severely when that one application somehow still gets it wrong. Or when you get a new device. Or when your browser uses Traditional Chinese in tab titles but Japanese in the content. Happened to me today.

This site has already got you out of stage 1! While you're still curious, you can use the tool at the top to display any character you want in the three versions and try out some especially interesting ones! Care to try?

