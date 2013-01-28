###* libworker.js
 *
 * Ver: 1.0.0
 * Who: Félix Saparelli
 * Web: https://github.com/passcod/libworker
 *
 * Released in the Public Domain
 * https://passcod.net/license.html
###

root = @
@addEventListener "message", (e) ->
  data = String e.data
  return if data.length < 5
  return unless data.slice(0, 5) == "eval:"
  root.eval.call root, data.slice 5, data.length - 5

class @libworker
  constructor: (@metal = new Worker libworker.src) ->
  send: (msg) -> @metal.postMessage msg
  eval: (val) -> @send "eval:#{String val}"
  
  # Contains the listener.
  @src: 'javascript:var b;b=this;this.addEventListener' +
        '("message",function(a){a=String(a.data);if(!(' +
        '5>a.length)&&"eval:"===a.slice(0,5))return b.' +
        'eval.call(b,a.slice(5,a.length-5))});'