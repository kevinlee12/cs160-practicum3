# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
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

handleOrientation = -> 
    utterance = new SpeechSynthesisUtterance "Leave me alone!!!"
    synth = window.speechSynthesis
    voices = synth.getVoices()
    synth.speak utterance 
    window.navigator.vibrate [200, 200, 200] 