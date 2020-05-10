import React from "react";
import Clock from "./frontend/clock";
import Tabs from "./frontend/tabs";
import Weather from "./frontend/weather"

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
      <Weather />
    </div>
  );
}

export default Root;
