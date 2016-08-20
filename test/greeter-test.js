'use strict';

const expect = require('chai').expect;  

const greeter = require('../lib/greeter');

describe('Greeter unit tests', () => {

    it('Returns the name if it has been provided', () => {
        const greeting = greeter.greet('Clark Kent');
        expect(greeting).to.eql('Hello, Clark Kent!');
    });

    it('Defaults to Hello World if no name has been provided', () => {
        const greeting = greeter.greet();
        expect(greeting).to.eql('Hello, World!');
    });

});