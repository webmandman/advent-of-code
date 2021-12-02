** Advent of Code - CFML Edition

Run every day with commandbox.

```
commandbox> task run 2021/day1 part1
```
or cd into 2021 then:
```
commandbox> task run day1 part2
```

I save the puzzle input in a text file and read the lines like so:

```
var input = fileRead('./day1-input.txt').listToArray(chr(13) & chr(10));
```

