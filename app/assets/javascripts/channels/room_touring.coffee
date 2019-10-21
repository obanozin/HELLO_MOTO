$(document).ready ->
  App.room_touring = App.cable.subscriptions.create { channel: "RoomTouringChannel", room_touring: $('#message_tourings').data('touring_id') },
    connected: ->
      # Called when the subscription is ready for use on the server

    disconnected: ->
      # Called when the subscription has been terminated by the server

    received: (data) ->
      $('#message_tourings').append data['message']

    speak: (message) ->
      @perform 'speak', message: message

  $(document).on 'keypress', '[data-behavior~=room_touring_speaker]', (event) ->
    if event.keyCode is 13 # return = send
      App.room_touring.speak event.target.value
      event.target.value = ''
      event.preventDefault()