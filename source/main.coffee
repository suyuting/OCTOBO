# ((window, document) ->
#   menu = document.getElementById('menu')
#   WINDOW_CHANGE_EVENT = if window.onorientationchange then 'orientationchange' else 'resize'

#   toggleHorizontal = ->
#     [].forEach.call document.getElementById('menu').querySelectorAll('.octobo-can-transform'), (el) ->
#       el.classList.toggle 'pure-menu-horizontal'
#       return
#     return

#   toggleMenu = ->
#     # set timeout so that the panel has a chance to roll up
#     # before the menu switches states
#     if menu.classList.contains('open')
#       setTimeout toggleHorizontal, 500
#     else
#       toggleHorizontal()
#     menu.classList.toggle 'open'
#     document.getElementById('toggle').classList.toggle 'x'
#     return

#   closeMenu = ->
#     if menu.classList.contains('open')
#       toggleMenu()
#     return

#   document.getElementById('toggle').addEventListener 'click', (e) ->
#     toggleMenu()
#     return
#   window.addEventListener WINDOW_CHANGE_EVENT, closeMenu
#   return
# ) this, @document
