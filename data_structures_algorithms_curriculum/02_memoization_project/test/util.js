const catchStackOverflow = (fn, ...args) => {
    try {
        return fn(...args);
    } catch (err) {
        if (err instanceof RangeError) {
            throw new Error('Stack Overflow');
        }
    }
};

module.exports = {
    catchStackOverflow
};