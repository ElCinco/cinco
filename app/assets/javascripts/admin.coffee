# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->
  processUrl = ->
    $.post "/admin/process_link",
      url: $('#link_url').val()
      (title) ->
        $('.url-title').append title

  options = {
    callback: processUrl
    wait: 1000
  }
  $('#link_url').typeWatch(options)
