# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->
  processUrl = ->
    $.ajax
      type: "POST"
      url: "/admin/process_link"
      data: { url: $('#link_url').val() }
      error: (jqXHR, textStatus, errorThrown) ->
        alert('error ' + textStatus + ' ' + errorThrown)
      success: (data, textStatus, jqXHR) ->
        $('.url-title').html data.title
        $('.title-header, .url-title').addClass('flash-in')


  options = {
    callback: processUrl
    wait: 300
  }
  $('#link_url').typeWatch(options)

  $(".flash-wrapper").delay(2000).fadeOut(300);
