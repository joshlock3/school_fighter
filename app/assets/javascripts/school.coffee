class School
  numResourceLoaded: 0
  totalResources: 0
  charX: 145
  charY: 50
  breathInc: 0.1
  breathDir: 1
  breathAmt: 0
  breathMax: 2
  fighting: 'right'
  fightState: false

  imageOffset: {
    'body': {x: 0, y: 0},
    'right-arm': {x: 0, y: 0},
    'left-arm': {x: 0, y: 0},
    'head': {x: 0, y: 0},
    'legs': {x: 0, y: 0},
  }

  constructor: (@context, @isReversed) ->
    @buffer = @createBuffer()
    @charX += 600 if @isReversed
    @images = {}

    @loadImage('body')
    @loadImage('head')
    @loadImage('left-arm')
    @loadImage('legs')
    @loadImage('right-arm')
    if @fighting == 'right'
      @loadImage('right-arm-fighting')
    else
      @loadImage('left-arm-fighting')

    setInterval(@updateBreath, 1000 / @fps)

  fight: ->
    @fightState = true
    setTimeout(@unFight, 1000)

  unFight: =>
    @fightState = false


  damage: =>

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

  redraw: =>
    if @fightState
      @drawImage('right-arm-fighting', true)
    else
      @drawImage('right-arm', true)
    @drawImage('body')
    @drawImage('head', true)
    @drawImage('legs')
    @drawImage('left-arm', true)


  drawImage: (imageName, doBreath) ->
    breathAmt = if doBreath then @breathAmt else 0
    image = @images[imageName]
    offset = @getOffset(imageName)

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

class window.DeltaState extends School
  school_name: 'delta_state',
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

class window.UCSD extends School
  school_name: 'ucsd',
  imageOffset: {
    'body': {x: 10, y: 150},
    'right-arm': {x: 90, y: 0},
    'right-arm-reversed': {x: -90, y: 0},
    'right-arm-fighting': {x: 30, y: 20},
    'right-arm-fighting-reversed': {x: -150, y: 20},
    'left-arm': {x: -30, y: 150},
    'left-arm-reversed': {x: 60, y: 150},
    'head': {x: 0, y: 50},
    'legs': {x: -35, y: 250},
  }
