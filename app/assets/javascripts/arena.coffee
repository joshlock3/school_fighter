class window.Arena
  fps: 30,
  startMessageCount: 0
  startMessageLimit: 30


  constructor: (@canvasDiv, @canvasWidth, @canvasHeight, @userId, @myCollegeId, @oppCollegeId, @mycollegeipeds, @oppcollegeipeds, @roundNumber, @result) ->
    @prepareCanvas(@canvasDiv, @canvasWidth, @canvasHeight)


    @school1 = switch @mycollegeipeds
      when 170976 then new Umich(@context, false)
      when 155681 then new PittsState(@context, false)
      when 238430 then new Stritch(@context, false)
      when 110680 then new UCSD(@context, false)
      when 175616 then new DeltaState(@context, false)
      else new DeltaState(@context, false) # shouldn't need this

    @school2 = switch @oppcollegeipeds
      when 170976 then new Umich(@context, true)
      when 155681 then new PittsState(@context, true)
      when 238430 then new Stritch(@context, true)
      when 110680 then new UCSD(@context, true)
      when 175616 then new DeltaState(@context, true)
      else new DeltaState(@context, true) # shouldn't need this

    setInterval(@redraw, 1000 / @fps)

    @startRound()
    setTimeout( =>
      switch @result
        when 2
          console.log "win"
          @school1.fight()
        when 1
          console.log "draw"
          setInterval( =>
            @school1.fight()
          , 2000)
          setInterval( =>
            @school2.fight()
          , 3000)
        when 0
          console.log "lose"
          @school2.fight()
        else console.log "what", @result
    , 3000)

    setTimeout( =>
      switch @roundNumber
        when 3
          console.log("Summary Page")
          window.location = "/versus/summary?user_id=" + @userId + "&my_school_id=" + @myCollegeId + "&opp_school_id=" + @oppCollegeId
        else
          @roundNumber += 1
          window.location = "/versus/arena?user_id=" + @userId + "&my_school_id=" + @myCollegeId + "&opp_school_id=" + @oppCollegeId +  "&round_number=" + @roundNumber
          console.log("next Page", @roundNumber)
     , 10000)

    #setInterval( =>
      #@school1.fight()
    #, 3000)
    #setInterval( =>
      #@school2.fight()
    #, 4000)


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
    if @school1.allImagesLoaded
      @canvas.width = @canvas.width # clears the canvas
      @fightMessage()
      @school1.redraw()
      @school2.redraw()

  fightMessage: () ->
    if @startMessageCount < @startMessageLimit
      @context.textAlign = 'center'
      @context.fillStyle = '#ffffff'
      @context.font="30px 'Press Start 2P'"
      @context.fillText('Fight!', @canvasWidth / 2, @canvasHeight / 2)
      @startMessageCount += 1

  startRound: ->
    @startMessageCount = 0

    @school1.start()
    @school2.start()
