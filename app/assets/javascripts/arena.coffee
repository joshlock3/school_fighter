class window.Arena
  fps: 30,

  constructor: (@canvasDiv, @canvasWidth, @canvasHeight) ->
    @prepareCanvas(@canvasDiv, @canvasWidth, @canvasHeight)
    #@school1 = new UCSD(@context, false)
    @school1 = new PittsState(@context, false)
    #@school1 = new DeltaState(@context, false)

    @school2 = new DeltaState(@context, true)
    #@school2 = new PittsState(@context, true)
    #@school2 = new UCSD(@context, true)

    setInterval(@redraw, 1000 / @fps)

    @school1.start()
    @school2.start()

    setInterval( =>
      @school1.fight()
    , 3000)
    setInterval( =>
      @school2.fight()
    , 4000)


  prepareCanvas: ->
    # Create the canvas (Neccessary for IE because it doesn't know what a canvas element is)
    @canvas = document.createElement('canvas')
    @canvas.setAttribute('width', @canvasWidth)
    @canvas.setAttribute('height', @canvasHeight)
    @canvas.setAttribute('id', 'canvas')
    @canvasDiv.appendChild(@canvas)

    if(typeof G_vmlCanvasManager != 'undefined')
      @canvas = G_vmlCanvasManager.initElement(@canvas)

    @context = @canvas.getContext("2d"); # Grab the 2d canvas context

    @canvas.width = @canvas.width; # clears the canvas
    @context.fillText("loading...", 40, 140)

  redraw: =>
    if @school1.allImagesLoaded
      @canvas.width = @canvas.width # clears the canvas
      @school1.redraw()
      @school2.redraw()
