class MaxHeap {
  constructor() {
    this.array = [null];
  }

  insert(val) {
    this.array.push(val);
    this.siftUp(this.array.length - 1);
  }

  siftUp(idx) {
    if (idx === 1) return;
    let parentIdx = this.getParent(idx);

    if (this.array[idx] > this.array[parentIdx]) {
      let temp = this.array[parentIdx];
      this.array[parentIdx] = this.array[idx];
      this.array[idx] = temp;
      this.siftUp(parentIdx);
    }
  }

  siftDown(idx) {
    let rightChildIdx = this.getRightChild(idx);
    let leftChildIdx = this.getLeftChild(idx);
    let rightVal = this.array[rightChildIdx];
    let leftVal = this.array[leftChildIdx];
    let rootVal = this.array[idx];

    if (rightVal === undefined) rightVal = -Infinity;
    if (leftVal === undefined) leftVal = -Infinity;

    if (rootVal > rightVal && rootVal > leftVal) return;

    let swapIdx;
    if (rightVal > leftVal) {
      swapIdx = rightChildIdx;
    } else {
      swapIdx = leftChildIdx;
    }

    let temp = this.array[idx];
    this.array[idx] = this.array[swapIdx];
    this.array[swapIdx] = temp;
    this.siftDown(swapIdx);
  }

  deleteMax() {
    if (this.array.length === 2) return this.array.pop();
    if (this.array.length === 1) return null;
    let max = this.array[1];
    this.array[1] = this.array.pop();
    this.siftDown(1);
    return max;
  }

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
