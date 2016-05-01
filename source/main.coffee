easeInOutSine = (t, startVal, endVal, duration) ->
  delta = endVal - startVal
  return -delta/2 * (Math.cos(Math.PI*t/duration) - 1) + startVal

# ---------------------------------------------------
# Smooth Scroll
# ---------------------------------------------------

scrollTo = (element, to, duration, cb) ->
  initialValue = element.scrollTop
  start = null
  step = (timestamp) ->
    if start is null
      start = timestamp
    progress = timestamp - start
    if progress < duration
      element.scrollTop = easeInOutSine(progress, initialValue, to, duration)
      window.requestAnimationFrame(step)
  cb()
  window.requestAnimationFrame(step)

# scrollTo = (element, to, duration) ->
#   if (duration <= 0)
#     return
#   difference = to - element.scrollTop
#   perTick = difference / duration * 10

#   setTimeout(() ->
#     element.scrollTop = element.scrollTop + perTick
#     if (element.scrollTop is to)
#       return
#     scrollTo(element, to, duration - 10)
#   , 10)

getTargetEl = (a) ->
  document.getElementById(a.getAttribute('href')[1..])

getScrollers = () ->
  a for a in document.getElementsByTagName('a') when a.getAttribute('href')[0] == '#'

for scroller in getScrollers()
  scroller.onclick = () ->
    target = getTargetEl(this)
    dest = if target? then target.offsetTop else 0
    duration = Math.abs(document.body.scrollTop - dest)/3
    console.log "HI"
    scrollTo(document.body, dest, duration, () -> window.location.hash = (if target? then target.id else '#'))
    false
# ---------------------------------------------------