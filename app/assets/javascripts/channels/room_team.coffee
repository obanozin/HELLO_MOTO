$(document).ready ->
  App.room_team = App.cable.subscriptions.create { channel: "RoomTeamChannel", room_team: $('#message_teams').data('team_id') },
    connected: ->
      # Called when the subscription is ready for use on the server

    disconnected: ->
      # Called when the subscription has been terminated by the server

    received: (data) ->
      $('#message_teams').prepend data['message']

    speak: (message) ->
      @perform 'speak', message: message


  $(document).on 'keypress', '[data-behavior~=room_team_speaker]', (event) ->
    if event.keyCode is 13 # return = send
      App.room_team.speak event.target.value
      event.target.value = ''
      event.preventDefault()