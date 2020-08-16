const { balancedParens } = require('../lib/1_balanced_parens.js');
const { expect } = require('chai');

describe('Problem 1: balancedParens', () => {
    let result;

    it('Should exist', () => {
        expect(balancedParens).to.exist;
    });

    it('Should be a function', () => {
        expect(balancedParens).to.be.a('function');
    });

    it('Should return a boolean', () => {
        result = balancedParens('()');

        expect(result).to.exist;
        expect(typeof result).to.equal('boolean');
    });

    it('Should return true for an empty string', () => {
        result = balancedParens('');

        expect(result).to.equal(true);
    });

    describe('When the input string contains only parentheses...', () => {
        it('Should return false for single character open-bracket strings, like: "("', () => {
            result = balancedParens('(');

            expect(result).to.equal(false);
        });

        it('Should return false for single character closed-bracket strings, like: ")"', () => {
            result = balancedParens(')');

            expect(result).to.equal(false);
        });

        it('Should return true for non-nested balanced strings, like: "()"', () => {
            result = balancedParens('()');

            expect(result).to.equal(true);
        });

        it('Should return false for non-nested unbalanced strings, like: ")("', () => {
            result = balancedParens(')(');

            expect(result).to.equal(false);
        });

        it('Should return true for nested balanced strings, like: "(()())"', () => {
            result = balancedParens('(()())');

            expect(result).to.equal(true);
        });

        it('Should return false for for nested unbalanced strings, like: "()()))"', () => {
            result = balancedParens('()()))');

            expect(result).to.equal(false);
        });

        it('Should return true for super-nested balanced strings, like: "(((((())))))"', () => {
            result = balancedParens('(((((())))))');

            expect(result).to.equal(true);
        });

        it('Should return false for super-nested un-balanced strings, like: "))))))(((((("', () => {
            result = balancedParens('))))))((((((');

            expect(result).to.equal(false);
        });
    });

    describe('When the input string contains parentheses and text...', () => {
        it('Should return true for non-nested, balanced strings, like: "let x = Math.floor(5.2);"', () => {
            result = balancedParens('let x = Math.floor(5.2);');

            expect(result).to.equal(true);
        });

        it('Should return false for non-nested, unbalanced strings, like: "let x = Math.floor(5.2;"', () => {
            result = balancedParens('let x = (5 + Math.floor(5.2);');

            expect(result).to.equal(false);
        });

        it('Should return true for nested, balanced strings, like: "let x = (5 + Math.floor(5.2));"', () => {
            result = balancedParens('let x = (5 + Math.floor(5.2));');

            expect(result).to.equal(true);
        });

        it('Should return false for nested, unbalanced strings, like: "let x = (5 + Math.floor(5.2);"', () => {
            result = balancedParens('let x = (5 + Math.floor(5.2);');

            expect(result).to.equal(false);
        });
    });

    describe('When the input string can contain all brackets (but not text) ...', () => {
        it('Should return false for single character, open square bracket strings, like: "["', () => {
            result = balancedParens('[');

            expect(result).to.equal(false);
        });

        it('Should return false for single character, closed sqaure bracket strings, like: "]"', () => {
            result = balancedParens(']');

            expect(result).to.equal(false);
        });

        it('Should return false for single character, open curly bracket strings, like: "{"', () => {
            result = balancedParens('{');

            expect(result).to.equal(false);
        });

        it('Should return false for single character, closed curly bracket strings, like: "}"', () => {
            result = balancedParens('}');

            expect(result).to.equal(false);
        });

        it('Should return true for non-nested, balanced, square bracket strings, like: "[]"', () => {
            result = balancedParens('[]');

            expect(result).to.equal(true);
        });

        it('Should return false for non-nested, unbalanced, square bracket strings, like: "]["', () => {
            result = balancedParens('][');

            expect(result).to.equal(false);
        });

        it('Should return true for non-nested, balanced, curly bracket strings, like: "{}"', () => {
            result = balancedParens('{}');

            expect(result).to.equal(true);
        });

        it('Should return false for non-nested, unbalanced, curly bracket strings, like: "}{"', () => {
            result = balancedParens('}{');

            expect(result).to.equal(false);
        });

        it('Should return true for non-nested, balanced, mixed-bracket strings, like: "()[]{}"', () => {
            result = balancedParens('()[]{}');

            expect(result).to.equal(true);
        });

        it('Should return false for non-nested, unbalanced, mixed-bracket strings, like: "{}][(["', () => {
            result = balancedParens('{}][([');

            expect(result).to.equal(false);
        });

        it('Should return true for nested, balanced, mixed-bracket strings, like: "([{}])"', () => {
            result = balancedParens('([{}])');

            expect(result).to.equal(true);
        });

        it('Should return false for nested, unbalanced, mixed-bracket strings, like: "([}{]})"', () => {
            result = balancedParens('([}{]})');

            expect(result).to.equal(false);
        });

        it('Should return true for super-nested, balanced, mixed-bracket strings, like: "((([[[{{{}}}]]])))"', () => {
            result = balancedParens('((([[[{{{}}}]]])))');

            expect(result).to.equal(true);
        });

        it('Should return false for super-nested, unbalanced, mixed-bracket strings, like: "((([[[{{{]]]}}})))"', () => {
            result = balancedParens('((([[[{{{]]]}}})))');

            expect(result).to.equal(false);
        });
    });

    describe('When the input string can contain all bracket and text...', () => {
        it('Should return true for the string: "const roundDown = function(num) { return Math.floor(num) };"', () => {
            result = balancedParens('const roundDown = function(num) { return Math.floor(num) };');

            expect(result).to.equal(true);
        });

        it('Should return true for the string: "{ array: [1, 2, [3, 4], 5], timesTwoMethod: (num) => num * 2; }"', () => {
            result = balancedParens('{ array: [1, 2, [3, 4], 5], timesTwoMethod: (num) => num * 2; }');

            expect(result).to.equal(true);
        });

        it('Should return false for the string: "function printThirdElement(array) { console.log(array[3]]] }"', () => {
            result = balancedParens('function printThirdElement(array) { console.log(array[3]]] }');

            expect(result).to.equal(false);
        });
    });
});