/**
 * Module dependencies.
 */

 // bir üst dizindeki modülümüzü çağırıyoruz
 var Guidify = require('../index.js');
 var assert = require('assert');
 
 suite('\033[36m Test guid creat \033[90m', function() {
   test('unique', function(done) {
     var guid = Guidify();
     assert.equal(typeof(guid), 'string', 'Should return a string' );
     assert.equal(guid.length, 20, 'Should return a string with length 20' );
     done();
   });
 });