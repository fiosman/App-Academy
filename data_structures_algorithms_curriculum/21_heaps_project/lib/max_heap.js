class MaxHeap {
  constructor() {
    this.array = [null];
  }

  insert(val) {
    this.array.push(val);
    this.siftUp(this.array.length - 1);
  }

  siftUp(idx) {}

  siftDown(idx) {}

  deleteMax() {}

  getParent(idx) {
      return Math.floor(idx / 2);
  }

  getLeftChild(idx) {
      return idx * 2; 
  }

  getRightChild(idx) {
      return idx * 2 + 1; 
  }
}

module.exports = {
  MaxHeap,
};
