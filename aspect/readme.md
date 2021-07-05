# Yet another aspect scaling library

Can handle best fit scaling for games, with specific resolution

## Install

`local aspect = require("aspect")`

## Functions

`setColor(r, g, b, a)` - set colors of "black" bars; `r` - red, `g` - green, `b` - blue, `a` - alpha; default - 0, 0, 0, 1

`getColor()`           - get colors of "black" bars; returns `red`, `green`, `blue`, `alpha`


`setGame(w, h)`        - set size of game, which library should scale to; `w` - width, `h` - height

`getGame()`            - get game width and size; returns `width`, `height`

`getGameWidth()`       - get game width; returns `width`

`getGameHeight()`      - get game height; returns `height`

`getGameAspect()`      - get game aspect, which gameWidth/gameHeight; returns `aspect`


`getOff()`             - get X and Y offset of black bars; retuns `xoff`, `yoff`

`getX()`               - get X offset of black bars; retuns `xoff`

`getY()`               - get Y offset of black bars; retuns `yoff`


`getScale()`           - get scale; returns `scale`

`getWindow()`

``
