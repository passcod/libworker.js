###* libworker.js
 *
 * Ver: 1.1.0
 * Who: Félix Saparelli
 * Web: https://github.com/passcod/libworker.js
 *
 * Released in the Public Domain
 * https://passcod.net/license.html
###

root = @
@addEventListener "message", (e) ->
  data = String e.data
  return if data.length < 5
  return unless data.slice(0, 5) == "eval:"
  root.eval.call root, data.slice 5

class @libworker
  constructor: (@metal = new Worker libworker.src) ->
  send: (msg) -> @metal.postMessage msg
  eval: (val) -> @send "eval:#{String val}"
  
  # Contains the listener.
  @src: "data:text/javascript;base64,dmFyIGI7Yj10aGlzO" +
        "3RoaXMuYWRkRXZlbnRMaXN0ZW5lcigibWVzc2FnZSIsZn" +
        "VuY3Rpb24oYSl7YT1TdHJpbmcoYS5kYXRhKTtpZighKDU" +
        "+YS5sZW5ndGgpJiYiZXZhbDoiPT09YS5zbGljZSgwLDUp" +
        "KXJldHVybiBiLmV2YWwuY2FsbChiLGEuc2xpY2UoNSkpfSk7"
