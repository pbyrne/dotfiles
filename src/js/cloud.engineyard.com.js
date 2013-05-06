if ($('#app .environment-name').text().indexOf('production') >= 0) {
  background = {
    'background-color': "rgba(255, 0, 0, 0.55)",
    'background-image': "url('http://i.imgur.com/i8KY7.gif')",
    'background-position': 'left top',
    'background-repeat': 'repeat'
  }
  $('#content').css(background)
  $('.page').css('background-color', 'white')
}
