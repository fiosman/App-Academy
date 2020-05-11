import React from "react";

function Headers(props) {
  const selectedTab = props.selectedTab;
  const headers = props.tabSections.map((ele, idx) => {
    const activeOrNot = idx === selectedTab ? "active" : "";

    return (
      <li
        key={idx}
        className={activeOrNot}
        onClick={() => props.tabClickHandler(idx)}
      >
        {ele.title}
      </li>
    );
  });

  return <ul className="tab-header">{headers}</ul>;
}

export default class Tabs extends React.Component {
  constructor(props) {
    super(props);
    this.state = { selectedPaneIdx: 0 };
    this.selectPane = this.selectPane.bind(this);
  }

  selectPane(idx) {
    this.setState({ selectedPaneIdx: idx });
  }

  render() {
    const selectedPane = this.props.tabSections[this.state.selectedPaneIdx];
    return (
      <div>
        <h1>Tabs</h1>
        <div className="tabs">
        <Headers
          tabSections={this.props.tabSections}
          selectedTab={this.state.selectedPaneIdx}
          tabClickHandler={this.selectPane}
        />
        <article className="tab-content">{selectedPane.content}</article>
        </div>
      </div>
    );
  }
}
