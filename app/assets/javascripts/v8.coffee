# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

#= require jquery-ui

$ ->
    $('#drop-square').draggable
        revert: "invalid"
    
    $('#dropzone1').droppable
        over: (event, ui) ->
            $(ui.draggable[0]).css('background-color', 'lightcoral')
        drop: (event, ui) ->
            $(ui.draggable[0]).css('background-color', 'firebrick')
        out: (event, ui) ->
            $(ui.draggable[0]).css('background-color', 'white')

    $('#dropzone2').droppable
        over: (event, ui) ->
            $(ui.draggable[0]).css('background-color', 'cornflowerblue')
        drop: (event, ui) ->
            $(ui.draggable[0]).css('background-color', 'darkblue')
        out: (event, ui) ->
            $(ui.draggable[0]).css('background-color', 'white')