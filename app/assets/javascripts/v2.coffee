# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

window.alpha = 0
window.beta = 0
window.gamma = 0

speak = ->
    synth = window.speechSynthesis
    utterance = new SpeechSynthesisUtterance "Leave me alone!!!"
    synth.speak utterance 
    window.navigator.vibrate [200, 200, 200] 
    $('#being').toggleClass('shake')
    return

handleOrientation = (event) ->
    difference = 0
    if window.alpha > 0 || window.beta > 0 || window.gamma > 0
        difference = Math.abs(window.alpha - event.alpha)
        difference += Math.abs(window.beta - event.beta)
        difference += Math.abs(window.gamma - event.gamma)
    else
        difference = 0
    
    console.log difference
    window.alpha = event.alpha
    window.beta = event.beta
    window.gamma = event.gamma
    if difference > 90
        $('#alone').show()
        $('#being').toggleClass('shake')
        speak()
        return

window.onbeforeunload = (e) ->
    synth.cancel()
    return

$ ->
    $('#alone').hide()
    $('#alone').click ->
        speak()
        return
    window.alpha = 0
    window.beta = 0
    window.gamma = 0

    if location.pathname == "/v2/instadesktop"
        console.log "Instadesktop!"
        video = $("#video")[0]
        $("#video").css("width": $("#webcam-feed").width() + 'px')
        if navigator.mediaDevices && navigator.mediaDevices.getUserMedia
            navigator.mediaDevices.getUserMedia(video: true).then (stream) ->
                video.src = window.URL.createObjectURL(stream)
                video.play()
                return

        canvas = $("#canvas")[0]
        $("#canvas").css("width": $("#snapshot").width() + 'px')
        context = canvas.getContext "2d"
        $("#snap").click () ->
            console.log 'Clicked!'
            context.drawImage video, 0, 0, 640, 480
            return
        
    else if location.pathname == "/v2/opposition"
        console.log "Opposition Mode!"
        window.addEventListener 'deviceorientation', handleOrientation, true