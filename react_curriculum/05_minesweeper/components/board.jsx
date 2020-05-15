import React from "react";
import Tile from "./tile.jsx";

export default class Board extends React.Component {
  constructor(props) {
    super(props);
  }

  render() {
    const grid = this.props.board.grid;
    const update = this.props.update;

    const tiles = grid.map((row, rowIdx) => (
      <tr className="row" key={rowIdx}>
        {row.map((tile, tileIdx) => (
          <Tile tile={tile} update={update} key={tileIdx} />
        ))}
      </tr>
    ));

    return (
      <table className="board">
        <tbody>{tiles}</tbody>
      </table>
    );
  }
}
