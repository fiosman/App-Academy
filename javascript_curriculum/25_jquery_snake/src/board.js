class Board { 
  constructor($el) { 
    this.$gameArea = $el;
    this.gridSize = 20;
  }
  
  drawGrid() { 
    for (let rowIdx = 0; rowIdx < this.gridSize; rowIdx++) { 
      const $tr = $("<tr>");
      this.$gameArea.append($tr); 
      for (let colIdx = 0; colIdx < this.gridSize; colIdx++) { 
        const $td = $("<td>");
        $td.data("cell-pos", [rowIdx, colIdx]);
        $tr.append($td);
      }
    }
  }
  
}

module.exports = Board