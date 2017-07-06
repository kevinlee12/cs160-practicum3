# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
    $("#sevenFourONine").click () ->
        location.href = "?screen=7409" 
        console.log "7409 button clicked"
        
    $("#sevenFourOFive").click () ->
        location.href = "?screen=7405"
        console.log "7405 button clicked" 