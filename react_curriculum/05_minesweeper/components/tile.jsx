import React from "react";

export default class Tile extends React.Component {
  constructor(props) {
    super(props);
    this.handleClick = this.handleClick.bind(this);
  }

  handleClick(e) {
    const flagTile = e.altKey;
    this.props.update(this.props.tile, flagTile);
  }

  render() {
    let tileStatus, className;
    const tile = this.props.tile;
    const adjacentBombs = tile.adjacentBombCount();

    if (tile.explored) {
      if (tile.bombed) {
        tileStatus = "\u2622";
        className = "bombed";
      } else {
        className = "explored";
        tileStatus = adjacentBombs > 0 ? adjacentBombs : "";
      }
    } else if (tile.flagged) {
      tileStatus = "\u2691";
      className = "flagged";
    } else {
      className = "unexplored";
    }

    className = `tile ${className}`;
    return (
      <td className={className} onClick={this.handleClick}>
        {tileStatus}
      </td>
    );
  }
}
