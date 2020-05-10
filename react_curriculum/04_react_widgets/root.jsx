import React from "react";
import Clock from "./frontend/clock";
import Tabs from "./frontend/tabs";

function Root(props) {
  const tabData = [
    {
      title: "Tab one",
      content: "I am one",
    },
    {
      title: "Tab two",
      content: "I am two",
    },
    {
      title: "Tab three",
      content: "I am three",
    },
  ];
  return (
    <div>
      <Clock />
      <Tabs tabSections={tabData} />
    </div>
  );
}

export default Root;
