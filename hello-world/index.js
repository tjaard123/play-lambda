'use strict';

console.log('Loading function');

exports.handler = (event, context, callback) => {
    console.log('Executing function');
    callback(null, 'Hello World!');
};