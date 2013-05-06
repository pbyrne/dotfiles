if ($('#app .environment-name').text().match('production')) {
  $('#content').css({
    'background-color': "rgba(255, 0, 0, 0.55)",
    'background-image': "url('http://i.imgur.com/i8KY7.gif')",
    'background-position': 'left top',
    'background-repeat': 'repeat'
  })
  $('.page').css('background-color', 'white')
}
