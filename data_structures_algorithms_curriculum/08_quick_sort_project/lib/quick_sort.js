function quickSort(array) {
    if (array.length <= 1) return array; 

    let pivot = array.shift(); 
    let lessThanPivot = array.filter((ele => ele < pivot)); 
    let greaterThanPivot = array.filter((ele => ele >= pivot)); 

    let sortedLess = quickSort(lessThanPivot); 
    let sortedGreater = quickSort(greaterThanPivot); 

    return [...sortedLess, pivot, ...sortedGreater];
}


module.exports = {
    quickSort
};