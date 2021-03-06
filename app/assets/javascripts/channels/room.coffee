$(document).ready ->
  App.room = App.cable.subscriptions.create { channel: "RoomChannel", room: $('#messages').data('room_id') },
    connected: ->
    	console.log("connected")
      # Called when the subscription is ready for use on the server

    disconnected: ->
    	console.log("disconnected")
      # Called when the subscription has been terminated by the server

    received: (data) ->
      $('#messages').prepend data['message']

    speak: (message) ->
      @perform 'speak', message: message

    $(document).on 'keypress', '[data-behavior~=room_speaker]', (event) ->
      if event.keyCode is 13 # return = send
        App.room.speak event.target.value
        event.target.value = ''
        event.preventDefault()
