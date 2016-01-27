class window.School
  numResourceLoaded: 0,
  totalResources: 0,
  images: {},
  charX: 245,
  charY: 50,
  breathInc: 0.1,
  breathDir: 1,
  breathAmt: 0,
  breathMax: 2,

  constructor: (@school_name, @context) ->
    @loadImage('body')
    @loadImage('head')
    @loadImage('left-arm')
    @loadImage('legs')
    @loadImage('right-arm')

    setInterval(@updateBreath, 1000 / @fps)

  idle: ->
  punch: ->
  damage: ->

  loadImage: (name) ->
    @totalResources += 1
    @images[name] = new Image()
    @images[name].onload = =>
      @numResourceLoaded += 1
    @images[name].src = "http://localhost:3000/assets/" + @school_name + "/" + name + ".png"

  allImagesLoaded: ->
    (@numResourceLoaded == @totalResources)

  redraw: ->
    x = @charX
    y = @charY

    @context.drawImage(@images["right-arm"], x + 130, y + 150 - @breathAmt)
    @context.drawImage(@images["body"], x + 10, y + 150)
    @context.drawImage(@images["head"], x, y - @breathAmt)
    @context.drawImage(@images["legs"], x - 25, y + 250) # x offset -25
    @context.drawImage(@images["left-arm"], x, y + 150 - @breathAmt)

  updateBreath: =>
    if @breathDir == 1
      # breath in
      @breathAmt -= @breathInc
      if @breathAmt < -@breathMax
        @breathDir = -1
    else
      # breath out
      @breathAmt += @breathInc
      if @breathAmt > @breathMax
        @breathDir = 1
