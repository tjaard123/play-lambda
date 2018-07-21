'use strict';

console.log('Loading function');

exports.handler = (event, context, callback) => {
   console.log('Hello Lambda Scraper!');
   callback(null, 'Hello World!');
};
