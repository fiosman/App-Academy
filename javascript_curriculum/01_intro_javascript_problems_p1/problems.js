// Phase I 

function mysteryScoping1() {
    var x = 'out of block';
    if (true) {
        var x = 'in block';
        console.log(x);
    }
    console.log(x);
}

function mysteryScoping2() {
    const x = 'out of block';
    if (true) {
        const x = 'in block';
        console.log(x);
    }
    console.log(x);
}

function mysteryScoping3() {
    const x = 'out of block';
    if (true) {
        var x = 'in block';
        console.log(x);
    }
    console.log(x);
}

function mysteryScoping4() {
    let x = 'out of block';
    if (true) {
        let x = 'in block';
        console.log(x);
    }
    console.log(x);
}

function mysteryScoping5() {
    let x = 'out of block';
    if (true) {
        let x = 'in block';
        console.log(x);
    }
    let x = 'out of block again';
    console.log(x);
}

const madLib = (verb, adjective, noun) => { 
    return `We shall ${verb.toUpperCase()} the ${adjective.toUpperCase()} ${noun.toUpperCase()}`;
} 

const isSubstring = (searchString, subString) => { 
    return searchString.includes(subString);
}

// Phase II 

const fizzBuzz = array => {  
    divisible = [];
    for (i = 0; i < array.length; i++) { 
        if (array[i] % 3 === 0 && array[i] % 5 === 0) { 
            continue; 
        } else if (array[i] % 3 === 0 || array[i] % 5 === 0) { 
            divisible.push(array[i]); 
        }
    }
    return divisible;
}

const isPrime = number => {  
    if (number === 2) { 
        return true; 
    }
    for (i = 2; i < number; i++) { 
        if (number % i == 0) { 
            return false;
        }
    }
    return true;
}

const sumOfNPrimes = n => { 
    let sum = 0; 
    let primes = [];
    let i = 2; 

    while (primes.length < n) { 
        if (isPrime(i)) { 
            primes.push(i);
            sum+= i;
        }    
        i++; 
    }
    return sum;
}
