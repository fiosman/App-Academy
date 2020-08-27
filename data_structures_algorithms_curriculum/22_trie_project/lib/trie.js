class Node {
    constructor() { 
        this.children = {};
        this.isTerminal = false;
    }
}

class Trie {
   constructor() { 
       this.root = new Node();
   }
}

module.exports = {
    Node,
    Trie
};