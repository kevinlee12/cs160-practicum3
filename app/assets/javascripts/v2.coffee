# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
    if location.pathname == "/v2/instadesktop"
        console.log "Instadesktop!"
    else if location.pathname == "/v2/opposition"
        console.log "Opposition Mode!"
        window.addEventListener 'deviceorientation', handleOrientation, true

handleOrientation = -> 
    utterance = new SpeechSynthesisUtterance "Leave me alone!!!"
    synth = window.speechSynthesis
    voices = synth.getVoices()
    synth.speak utterance 
    window.navigator.vibrate [200, 200, 200] 