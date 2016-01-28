class window.Arena
  fps: 30,

  constructor: (@canvasDiv, @canvasWidth, @canvasHeight, @mycollegeipeds, @oppcollegeipeds) ->
    @prepareCanvas(@canvasDiv, @canvasWidth, @canvasHeight)

    @school1 = switch @mycollegeipeds
      when 170976 then new Umich(@context, false)
      when 155681 then new PittsState(@context, false)
      when 238430 then new Stritch(@context, false)
      when 110680 then new UCSD(@context, false)
      when 175616 then new DeltaState(@context, false)

    @school2 = switch @oppcollegeipeds
      when 170976 then new Umich(@context, true)
      when 155681 then new PittsState(@context, true)
      when 238430 then new Stritch(@context, true)
      when 110680 then new UCSD(@context, true)
      when 175616 then new DeltaState(@context, true)


    console.log(@school2, @oppcollegeipeds)

    setInterval(@redraw, 1000 / @fps)

    @startRound()


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

  redraw: =>
    @context.textAlign = 'center'
    @context.fillStyle = '#ffffff'
    @context.font="30px 'Press Start 2P'"
    @context.fillText('Fight!', @canvasWidth / 2, @canvasHeight / 2)

    #if @school1.allImagesLoaded
      #@canvas.width = @canvas.width # clears the canvas
      #@school1.redraw()
      #@school2.redraw()

  startRound: ->

    @school1.start()
    @school2.start()
