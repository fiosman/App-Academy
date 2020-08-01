const util = require("./util");
const chai = require('chai');
chai.use(require('chai-spies'));
const { expect, spy } = chai;

const { 
    lucasNumber,
    sumArray,
    reverseString,
    pow,
    flatten,
    fileFinder,
    pathFinder
} = require('../lib/problems');


describe('lucasNumber(n)', () => {
    it('should return the n-th number of the lucas sequence', () => {
        util.catchStackOverflow(lucasNumber, 10);
        
        expect(lucasNumber(0)).to.equal(2);
        expect(lucasNumber(1)).to.equal(1);
        expect(lucasNumber(5)).to.equal(11);
        expect(lucasNumber(9)).to.equal(76);
    });
});

describe('sumArray(array)', () => {
    it('should return the sum of the elements in the array', () => {
        util.catchStackOverflow(sumArray, [5, 2]);

        expect(sumArray([])).to.equal(0);
        expect(sumArray([5])).to.equal(5);
        expect(sumArray([5, 2])).to.equal(7);
        expect(sumArray([4, 10, -1, 2])).to.equal(15);
    });
});

describe('reverseString(str)', () => {
    it('should return string with the characters in reverse order', () => {
        util.catchStackOverflow(reverseString, 'abc');

        expect(reverseString('')).to.equal('');
        expect(reverseString('c')).to.equal('c');
        expect(reverseString('internet')).to.equal('tenretni');
        expect(reverseString('friends')).to.equal('sdneirf');
    });
});

describe('pow(base, exponent)', () => {
    it('should return 1 when the exponent is 0', () => {
        util.catchStackOverflow(pow, 2, 0);

        expect(pow(2, 0)).to.equal(1);
        expect(pow(7, 0)).to.equal(1);
    });

    it('should calculate `base` raised to the `exponent` power', () => {
        util.catchStackOverflow(pow, 2, 5);

        expect(pow(2, 5)).to.equal(32);
        expect(pow(5, 2)).to.equal(25);
        expect(pow(2, 4)).to.equal(16);
    });

    it('should correctly calculate negative exponents', () => {
        util.catchStackOverflow(pow, 2, -5);

        expect(pow(2, -5)).to.equal(0.03125);
        expect(pow(4, -3)).to.equal(0.015625);
    });
});

describe('flatten(data)', () => {
    it('should return the array in 1-dimensional flattened form', () => {
        array_1 = [1, 2, [[3, 4], [5, [6]]], [7, 8]]
        util.catchStackOverflow(flatten, array_1);
        
        expect(flatten(array_1)).to.eql([ 1, 2, 3, 4, 5, 6, 7, 8 ]);

        array_2 = ['this', ['problem', 'is'], [['pretty', 'tough'], [[':)']]]]
        expect(flatten(array_2)).to.eql([ 'this', 'problem', 'is', 'pretty', 'tough', ':)']);
    });
});


describe('fileFinder(directories, targetFile)', () => {
    let desktop = {
        '/images': {
            'app_academy_logo.svg': null,
            '/parks': {
                'yosemite.jpeg': null,
                'acadia.jpeg': null,
                'yellowstone.png': null
            },
            '/pets': {
                'trixie_lou.jpeg': null,
                'rolo.jpeg': null,
                'opal.jpeg': null,
                'diana.jpeg': null,
            }
        },
        '/music': {
            'hey_programmers.mp3': null,
            '/genres': {
                '/rock': {
                    'everlong.flac': null,
                    'livin_on_a_prayer.mp3': null
                },
                '/hip_hop': {
                    'express_yourself.wav': null,
                    'ny_state_of_mind.mp3': null
                }
            }
        }
    };
    
    let curriculum = {
        '/javascript': {
            '/week_1': {
                '/day_1': {
                    '/readings': {
                        'intro_to_recursion.md': null,
                        'fibonacci_example.txt': null
                    },
                    '/projects': {
                        '/recursion_project': {
                            '/lib': {
                                'problems.js': null
                            },
                            '/test': {
                                'test.js': null
                            }
                        }
                    }
                }
            }
        }
    };

    context('when the file is found in the directories', () => {
        it('should return true', () => {
            expect(fileFinder(desktop, 'app_academy_logo.svg')).to.equal(true);
            expect(fileFinder(desktop, 'everlong.flac')).to.equal(true);
            expect(fileFinder(curriculum, 'problems.js')).to.equal(true);
            expect(fileFinder(curriculum, 'intro_to_recursion.md')).to.equal(true);
        });
    });

    context('when the file is not found in the directories', () => {
        it('should return false', () => {
            expect(fileFinder(desktop, 'never_gonna_give_you_up.flac')).to.equal(false);
            expect(fileFinder(curriculum, 'recursion_project.js')).to.equal(false);
        });
    });
});

describe('pathFinder(directories, targetFile)', () => {
    let desktop = {
        '/images': {
            'app_academy_logo.svg': null,
            '/parks': {
                'yosemite.jpeg': null,
                'acadia.jpeg': null,
                'yellowstone.png': null
            },
            '/pets': {
                'trixie_lou.jpeg': null,
                'rolo.jpeg': null,
                'opal.jpeg': null,
                'diana.jpeg': null,
            }
        },
        '/music': {
            'hey_programmers.mp3': null,
            '/genres': {
                '/rock': {
                    'everlong.flac': null,
                    'livin_on_a_prayer.mp3': null
                },
                '/hip_hop': {
                    'express_yourself.wav': null,
                    'ny_state_of_mind.mp3': null
                }
            }
        }
    };
    
    let curriculum = {
        '/javascript': {
            '/week_1': {
                '/day_1': {
                    '/readings': {
                        'intro_to_recursion.md': null,
                        'fibonacci_example.txt': null
                    },
                    '/projects': {
                        '/recursion_project': {
                            '/lib': {
                                'problems.js': null
                            },
                            '/test': {
                                'test.js': null
                            }
                        }
                    }
                }
            }
        }
    };

    context('when the file is found in the directories', () => {
        it('should return the path', () => {
            expect(pathFinder(desktop, 'app_academy_logo.svg')).to.equal('/images/app_academy_logo.svg');
            expect(pathFinder(desktop, 'everlong.flac')).to.equal('/music/genres/rock/everlong.flac');
            expect(pathFinder(curriculum, 'problems.js')).to.equal('/javascript/week_1/day_1/projects/recursion_project/lib/problems.js');
            expect(pathFinder(curriculum, 'intro_to_recursion.md')).to.equal('/javascript/week_1/day_1/readings/intro_to_recursion.md');
        });
    });

    context('when the file is not found in the directories', () => {
        it('should return null', () => {
            expect(pathFinder(desktop, 'never_gonna_give_you_up.flac')).to.equal(null);
            expect(pathFinder(curriculum, 'recursion_project.js')).to.equal(null);
        });
    });
});