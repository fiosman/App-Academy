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

  getParent(idx) {}

  getLeftChild(idx) {}

  getRightChild(idx) {}
}

module.exports = {
  MaxHeap,
};
