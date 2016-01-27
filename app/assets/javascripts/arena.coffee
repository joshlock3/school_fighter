class window.Arena
  fps: 30,

  constructor: (@canvasDiv, @canvasWidth, @canvasHeight) ->
    @prepareCanvas(@canvasDiv, @canvasWidth, @canvasHeight)
    @school1 = new DeltaState(@context)

    setInterval(@redraw, 1000 / @fps)

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
