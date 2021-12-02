## Advent of Code - CFML Edition

Run every day with commandbox.

```
commandbox> task run day1-part1.cfc
```

I save the puzzle input in a text file and read the lines like so:

```
var input = fileRead('./day1-part1.txt').listToArray(chr(13) & chr(10));
```

