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

  getDestinationRoot(prefix) {
    let root = this.root;

    for (let i = 0; i < prefix.length; i++) {
      let letter = prefix[i];
      if (letter in root.children) {
        root = root.children[letter];
      }

      return root;
    }
  }

  //in progress ^_____^
  wordsWithPrefix(prefix) {
    let prefixChildren = this.getDestinationRoot(prefix).children;

    let queue = [Object.keys(prefixChildren)];
    let word = prefix;
    let recognized = [];

    // console.log(prefixChildren);

    while (queue.length > 0) {
      let letter = queue.shift();
      word += letter;

      if (prefixChildren[letter].isTerminal) {
        if (this.hasChildren(prefixChildren[letter])) {
          recognized.push(word);
        } else {
          recognized.push(word);
          word = prefix;
        }
      }

      if (Object.keys(prefixChildren[letter].children).length > 0) {
        prefixChildren = prefixChildren[letter].children;

        for (let key in prefixChildren) {
          queue.push(key);
        }
      }
    }

    return recognized;
  }

  hasChildren(node) {
    return Object.keys(node).length > 0;
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

// let trie = new Trie();

// console.log(trie.longestWord(['a', 'banana', 'app', 'appl', 'ap', 'apply', 'apple']));
// trie.insertRecur("aapple");
// trie.insertRecur("tea");
// trie.insertRecur("taco");
// trie.insertRecur("tex");
// trie.insertRecur("in");
// trie.insertRecur("inn");
// trie.insertRecur("inside");
// trie.insertRecur("instructor");

// console.log(trie.wordsWithPrefix("i"));

