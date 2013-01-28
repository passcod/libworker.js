```javascript
/** libworker.js
 *
 * A tiny (750 bytes) wrapper around WebWorkers to enable
 * source-less workers in a clean and lightweight manner.
 *
 * Ver: 1.0.0
 * Who: Félix Saparelli
 * Web: https://github.com/passcod/libworker.js
 *
 * Released in the Public Domain
 * https://passcod.net/license.html
 */


"usage";

var worker = new libworker; // ~= new Worker("source.js")
worker.send("something");   // == #postMessage("something")
worker.eval("some_code()"); // ~~ Evaluates in the web worker
worker.metal.onmessage = f; // ~~ Access the bare Worker easily
```