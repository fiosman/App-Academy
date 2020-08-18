function inOrderArray(root) {
    if (!root) return []; 

    return([...inOrderArray(root.left), root.val, ...inOrderArray(root.right)])
}

function postOrderArray(root) {

}


module.exports = {
    inOrderArray,
    postOrderArray
};