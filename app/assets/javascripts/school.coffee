class BaseSchool
  numResourceLoaded: 0
  totalResources: 0
  charX: 145
  charY: 50
  breathInc: 0.1
  breathDir: 1
  breathAmt: 0
  breathMax: 2

  constructor: (@context, @isReversed) ->
    @buffer = @createBuffer()
    @charX += 600 if @isReversed
    @images = {}
    setInterval(@updateBreath, 1000 / @fps)


  drawImage: (imageName, doBreath) ->
    breathAmt = if doBreath then @breathAmt else 0
    image = @images[imageName]
    offset = @getOffset(imageName)

    console.log(imageName) if image == undefined
    @processReverse(image) if image.processedReverse == undefined
    @context.drawImage(image, @charX + offset['x'], @charY + offset['y'] - breathAmt)

  getOffset: (imageName) ->
    if @isReversed
      return @imageOffset[imageName + "-reversed"] || @imageOffset[imageName]
    else
      return @imageOffset[imageName]

  processReverse: (image) =>
    if @isReversed
      try
        width = image.width
        height = image.height
        @buffer.width = @buffer.width # clears the buffer
        context = @buffer.getContext("2d")
        context.drawImage(image, 0, 0)
        data = @reverseImage(context.getImageData(0, 0, width, height))
        @buffer.width = @buffer.width # clears the buffer
        context.putImageData(data, 0, 0, 0, 0, width, height)
        image.src = @buffer.toDataURL('image/png')
        image.processedReverse = true
      catch error
        #console.log(error)

  reverseImage: (imageData) ->
    i = 0
    while i < imageData.height
      # We only need to do half of every row since we're flipping the halves
      j = 0
      while j < imageData.width / 2
        index = i * 4 * imageData.width + j * 4
        mirrorIndex = (i + 1) * 4 * imageData.width - ((j + 1) * 4)
        p = 0
        while p < 4
          temp = imageData.data[index + p]
          imageData.data[index + p] = imageData.data[mirrorIndex + p]
          imageData.data[mirrorIndex + p] = temp
          p++
        j++
      i++
    return imageData

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

  loadImage: (name) ->
    @totalResources += 1
    @images[name] = new Image()
    @images[name].onload = =>
      @numResourceLoaded += 1
    @images[name].src = "/assets/" + @school_name + "/" + name + ".png"

  allImagesLoaded: ->
    (@numResourceLoaded == @totalResources)

  createBuffer: ->
    buffer = document.createElement('canvas')
    buffer.width = 500
    buffer.height = 500
    return buffer

# END BaseSchool
###############################################

class School extends BaseSchool
  fighting: 'right'
  imageFaces: 'right'
  fightState: false
  startDistanceTraveled: 0
  startDistanceIncrement: 10
  startDistance: 150

  imageOffset: {}

  constructor: (@context, @isReversed) ->
    super

    @loadImage('body')
    @loadImage('head')
    @loadImage('left-arm')
    @loadImage('legs')
    @loadImage('right-arm')
    if @fighting == 'right'
      @loadImage('right-arm-fighting')
    else
      @loadImage('left-arm-fighting')

  fight: ->
    @fightState = true
    setTimeout(@unFight, 1000)

  unFight: =>
    @fightState = false


  start: ->
    if @startDistanceTraveled < @startDistance
      setTimeout( =>
        if @isReversed
          @charX -= @startDistanceIncrement
        else
          @charX += @startDistanceIncrement
        @startDistanceTraveled += @startDistanceIncrement
        @start()
      , 190)

  redraw: =>
    if @fightState and @fighting == 'right'
      @drawImage('right-arm-fighting', true)
    else
      @drawImage('right-arm', true)

    @drawImage('legs')
    @drawImage('body', true)
    @drawImage('head', true)

    if @fightState and @fighting == 'left'
      @drawImage('left-arm-fighting', true)
    else
      @drawImage('left-arm', true)



# END School
###############################################

# Begin College Classes
class window.DeltaState extends School
  school_name: 'delta_state',
  fighting: 'right'
  imageFaces: 'right'
  imageOffset: {
    'body': {x: 10, y: 150},
    'body-reversed': {x: -10, y: 150},
    'right-arm': {x: 130, y: 150},
    'right-arm-reversed': {x: -50, y: 150},
    'right-arm-fighting': {x: 130, y: 150},
    'right-arm-fighting-reversed': {x: -70, y: 150},
    'left-arm': {x: 0, y: 150},
    'left-arm-reversed': {x: 30, y: 150},
    'head': {x: 0, y: 0},
    'legs': {x: -25, y: 250},
  }

class window.PittsState extends School
  school_name: 'pitts_state',
  fighting: 'left'
  imageFaces: 'left'
  imageOffset: {
    'head': {x: 25, y: 60},

    'left-arm-fighting': {x: -180, y: 90},
    'left-arm-fighting-reversed': {x: 82, y: 90},
    'left-arm': {x: -126, y: -20},
    'left-arm-reversed': {x: 110, y: -20},

    'body': {x: 10, y: 150},
    'body-reversed': {x: 10, y: 150},

    'right-arm': {x: 100, y: 150},
    'right-arm-reversed': {x: -60, y: 150},

    'legs': {x: 45, y: 260},
    'legs-reversed': {x: -25, y: 260},
  }

class window.Stritch extends School
  school_name: 'stritch',
  fighting: 'right'
  imageFaces: 'right'
  imageOffset: {
    'head': {x: 85, y: 0},
    'head-reversed': {x: -10, y: 0},

    'left-arm': {x: -5, y: 80},
    'left-arm-reversed': {x: 50, y: 80},

    'body': {x: 47, y: 58},
    'body-reversed': {x: -35, y: 58},

    'right-arm': {x: 180, y: 80},
    'right-arm-reversed': {x: -60, y: 80},
    'right-arm-fighting': {x: 180, y: 90},
    'right-arm-fighting-reversed': {x: -200, y: 90},

    'legs': {x: 45, y: 200},
    'legs-reversed': {x: -25, y: 200},
  }

class window.UCSD extends School
  school_name: 'ucsd',
  fighting: 'right'
  imageFaces: 'right'
  imageOffset: {
    'head': {x: 0, y: 50},

    'left-arm': {x: -30, y: 150},
    'left-arm-reversed': {x: 60, y: 150},

    'body': {x: 10, y: 150},
    'body-reversed': {x: 20, y: 150},


    'right-arm': {x: 90, y: 0},
    'right-arm-reversed': {x: -90, y: 0},
    'right-arm-fighting': {x: 30, y: 20},
    'right-arm-fighting-reversed': {x: -150, y: 20},

    'legs': {x: -35, y: 250},
  }

class window.Umich extends School
  school_name: 'umich',
  fighting: 'left'
  imageFaces: 'left'
  imageOffset: {
    'head': {x: 215, y: 180},
    'head-reversed': {x: -110, y: 180},

    'left-arm': {x: 45, y: 90},
    'left-arm-reversed': {x: -20, y: 90},
    'left-arm-fighting': {x: 75, y: 110},
    'left-arm-fighting-reversed': {x: -80, y: 110},

    'body': {x: 130, y: 210},
    'body-reversed': {x: -90, y: 210},

    'right-arm': {x: 200, y: 150},
    'right-arm-reversed': {x: -180, y: 150},

    'legs': {x: 0, y: 260},
    'legs-reversed': {x: -80, y: 260},
  }
