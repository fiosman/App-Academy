import React from "react";

class Calculator extends React.Component {
  constructor(props) {
    super(props);
    this.state = { res: 0, num1: "", num2: "" };

    this.setNum1 = this.setNum1.bind(this);
    this.setNum2 = this.setNum2.bind(this);
    this.add = this.add.bind(this);
    this.subtract = this.subtract.bind(this);
    this.multiply = this.multiply.bind(this);
    this.divide = this.divide.bind(this);
    this.clear = this.clear.bind(this);
  }

  setNum1(e) {
    this.setState({ num1: e.currentTarget.value });
  }

  setNum2(e) {
    this.setState({ num2: e.currentTarget.value });
  }

  add(e) {
    e.preventDefault();
    this.setState({
      res: Number(this.state.num1) + Number(this.state.num2),
    });
  }

  subtract(e) {
    e.preventDefault();
    this.setState({
      res: Number(this.state.num1) - Number(this.state.num2),
    });
  }

  multiply(e) {
    e.preventDefault();
    this.setState({
      res: Number(this.state.num1) * Number(this.state.num2),
    });
  }

  divide(e) {
    e.preventDefault();
    this.setState({
      res: Number(this.state.num1) / Number(this.state.num2),
    });
  }

  clear(e) {
    e.preventDefault();
    this.setState({ res: 0, num1: "", num2: "" });
  }

  render() {
    const { num1, num2, res } = this.state;
    return (
      <div>
        <h1>{res}</h1>
        <input onChange={this.setNum1} value={num1}></input>
        <input onChange={this.setNum2} value={num2}></input>
        <button onClick={this.clear}>Clear</button>
        <button onClick={this.add}>+</button>
        <button onClick={this.subtract}>-</button>
        <button onClick={this.multiply}>*</button>
        <button onClick={this.divide}>/</button>
      </div>
    );
  }
}

export default Calculator;
