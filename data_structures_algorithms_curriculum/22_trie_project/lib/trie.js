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

  insertRecur(word, root = this.root) {
    let letter = word[0];

    if (!(letter in root.children)) {
      root.children[letter] = new Node();
    }

    if (word.length === 1) {
      root.children[letter].isTerminal = true;
    } else {
      this.insertRecur(word.slice(1), root.children[letter]);
    }
  }

  insertIter(word) {
    let root = this.root;
    for (let i = 0; i < word.length; i++) {
      let letter = word[i];
      if (!(letter in root.children)) {
        root.children[letter] = new Node();
      }
      root = root.children[letter];
    }

    root.isTerminal = true;
  }

  searchRecur(word, root = this.root) {
    let letter = word[0];

    if (letter in root.children) {
      if (root.children[letter].isTerminal === true && word.length === 1) {
        return true;
      } else {
        return this.searchRecur(word.slice(1), root.children[letter]);
      }
    }

    return false;
  }
}

module.exports = {
  Node,
  Trie,
};

// let trie = new Trie();
// trie.insertRecur("ten");
// trie.insertRecur("tea");
// trie.insertRecur("in");
// trie.insertRecur("inn");

// console.log(trie.searchRecur("ten"));
// console.log(trie.searchRecur("tea"));
// console.log(trie.searchRecur("in"));
// console.log(trie.searchRecur("inx"));
