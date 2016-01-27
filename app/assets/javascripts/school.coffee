class School
  numResourceLoaded: 0,
  totalResources: 0,
  images: {},
  charX: 245,
  charY: 50,
  breathInc: 0.1,
  breathDir: 1,
  breathAmt: 0,
  breathMax: 2,

  imageOffset: {
    'body': {x: 0, y: 0},
    'right-arm': {x: 0, y: 0},
    'left-arm': {x: 0, y: 0},
    'head': {x: 0, y: 0},
    'legs': {x: 0, y: 0},
  }

  constructor: (@context) ->
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

    @context.drawImage(@images["right-arm"], x + @imageOffset['right-arm']['x'], y + @imageOffset['right-arm']['y'] - @breathAmt)
    @context.drawImage(@images["body"], x + @imageOffset['body']['x'], y + @imageOffset['body']['y'])
    @context.drawImage(@images["head"], x + @imageOffset['head']['x'], y + @imageOffset['head']['y'] - @breathAmt)
    @context.drawImage(@images["legs"], x + @imageOffset['legs']['x'], y + @imageOffset['legs']['y']) # x offset -25
    @context.drawImage(@images["left-arm"], x + @imageOffset['left-arm']['x'], y + @imageOffset['left-arm']['y'] - @breathAmt)

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

class window.DeltaState extends School
  school_name: 'delta_state',
  imageOffset: {
    'body': {x: 10, y: 150},
    'right-arm': {x: 130, y: 150},
    'left-arm': {x: 0, y: 150},
    'head': {x: 0, y: 0},
    'legs': {x: -25, y: 250},
  }
