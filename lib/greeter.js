'use strict';

function greet(name) {
    name = name || 'World';
    return `Hello, ${name}!`;
}

module.exports = {
    greet
};