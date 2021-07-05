# Yet another aspect scaling library

Can handle best fit scaling for games with specific resolution

[![Video](https://img.youtube.com/vi/o_MaN1znbqw/0.jpg)](https://www.youtube.com/watch?v=o_MaN1znbqw)

## Install

`local aspect = require("aspect")`

## Functions

`setColor(r, g, b, a)` - set colors of "black" bars; arguments `r` - red - number, `g` - green - number, `b` - blue - number, `a` - alpha - number; default - 0, 0, 0, 1
`getColor()`           - get colors of "black" bars; return `red` - number, `green` - number, `blue` - number, `alpha` - number
#
`setGame(w, h)`        - set size of game, which library should scale to; arguments `w` - width - number, `h` - height - number

`getGame()`            - get game width and size; return `width` - number, `height` - number

`getGameWidth()`       - get game width; return `width` - number

`getGameHeight()`      - get game height; return `height` - number
#
`getOff()`             - get X and Y offset of black bars; return `xoff` - number, `yoff` - number

`getX()`               - get X offset of black bars; return `xoff` - number

`getY()`               - get Y offset of black bars; return `yoff` - number
#
`getScale()`           - get scale; return `scale` - number
#
`getWindow()`          - get window width and height; return `width` - number, `height` - number

`getWindowWidth()`     - get window width; return `width` - number

`getWindowHeight()`    - get window height; return `height` - number
#
`getBar1()`, `getBar2`     - get 1 or 2 bar positions (if horizontal - 1st = left, 2nd = right; if vertical - 1st = upper, 2nd = bottom); return `x` - x of rectangle - number, `w` - width of rectangle - number, `y` - y of rectangle - number, `h` - height of rectangle - number
#
`update()`                 - update all data; call it before everything, where you need use values from library

`start()`                  - start scaling; everything after that will be drawed scaled

`stop()`                   - stop scaling, draw "black" bars
