'use strict';

const greeter = require('./lib/greeter');

exports.handler = function(event, context) {
    console.log('Event:', JSON.stringify(event));
    
    const greeting = greeter.greet(event.name);
    context.succeed({greeting: greeting});
};