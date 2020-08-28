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

  searchIter(word) {
    let root = this.root;
    for (let i = 0; i < word.length; i++) {
      let letter = word[i];
      if (letter in root.children) {
        if (root.children[letter].isTerminal) {
          return true;
        }
        root = root.children[letter];
      }
    }

    return false;
  }

  //in progress, pretty tough problem!
  wordsWithPrefix(prefix) {
    let root = this.root;
    let recognized = [];

    for (let i = 0; i < prefix.length; i++) {
      let letter = prefix[i];
      if (letter in root.children) {
        root = root.children[letter];
      }
    }

    let destinationRoot = root;
    let newRoot = destinationRoot;
    let children = Object(root.children).keys;
    for (let letter in destinationRoot.children) {
      let word = prefix;
      if (newRoot.children[letter].isTerminal === false) {
        word += letter;
        newRoot = newRoot.children[letter];
      } else {
        word += letter;
        recognized.push(word);
        word = prefix;
      }
    }

    return recognized;
  }

  //returns true if any word in the trie starts with the given prefix, false otherwise, ezzzz
  startsWith(prefix) {
    let root = this.root;
    let currLetter = prefix[0];

    for (let i = 0; i < prefix.length; i++) {
      if (currLetter in root.children) {
        root = root.children[currLetter];
      } else {
        return false;
      }
      currLetter = prefix[i + 1];
    }

    return true;
  }
}

module.exports = {
  Node,
  Trie,
};

let trie = new Trie();

trie.insertRecur("apple");
// trie.insertRecur("tea");
// trie.insertRecur("taco");
// trie.insertRecur("tex");
// trie.insertRecur("in");
// trie.insertRecur("inn");
// trie.insertRecur("inside");
// trie.insertRecur("instructor");

// console.log(trie.wordsWithPrefix("te"));

console.log(trie.startsWith("apple"));
