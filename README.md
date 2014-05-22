# Scratchpad

![Scratchpad Screenshot](http://i.imgur.com/Nfy2o6j.png)

Scratchpad is an Atom extension that provides a convenient place to jot
down notes or paste text. Use `ctrl-alt-,` to toggle the scratchpad. Scratchpad's
height and opacity can be overridden by adding the following to your config.cson file;

```
'scratchpad':
  'rows': 15
  'opacity': .75
```

In this case, the minimum number of rows displayed is 15 and the Scratchpad is
sightly transparent. Opacity must be a value between 0 and 1.

Scratchpad is simply an HTML textarea element, allowing it to easily be resized
to your needs. Additionally, Scratchpad's is persistent, meaning notes will
stay in Scratchpad until explicitly deleted.
