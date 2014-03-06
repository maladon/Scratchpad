# Scratchpad

![Scratchpad Screenshot](http://i.imgur.com/Nfy2o6j.png)

Scratchpad is an Atom extension that provides a convenient place to jot
down notes or paste text. Use `ctrl-alt-,` to toggle the scratchpad. Scratchpad's
height can be overridden by adding the following to your config.cson file, where rows is the
minimum number of rows which will be displayed:

```
'scratchpad':
  'rows': 15
```

Scratchpad is simply an HTML textarea element, allowing it to easily be resized
to your needs. Additionally, Scratchpad's is persistent, meaning notes will
stay in Scratchpad until explicitly deleted.
