import React from "react";

export default class Weather extends React.Component {
  constructor() {
    super();
    this.state = { temperature: null, city: null };
    this.openWeather = this.openWeather.bind(this);
  }

  componentDidMount() {
    navigator.geolocation.getCurrentPosition(this.openWeather);
  }

  openWeather(position) {
    const request = new XMLHttpRequest();
    const latitude = position.coords.latitude;
    const longitude = position.coords.longitude;
    const url = `http://api.openweathermap.org/data/2.5/weather?lat=${latitude}&lon=${longitude}&appid=6bd265b3af653f8fa56c6a63d424407c`;

    request.open("GET", url, true);

    request.onload = () => {
      if (request.status >= 200 && request.status < 400) {
        const data = JSON.parse(request.response);
        const city = data.name;
        const temperature = (data.main.temp - 273.15).toFixed(0);
        this.updateState({ city, temperature });
      }
    };
    request.send();
  }

  updateState(data) {
    this.setState({ temperature: data.temperature, city: data.city });
  }

  render() {
    return this.state.city ? (
      <div>
        <span>Location: {this.state.city}</span>
        <span>Temperature: {this.state.temperature}</span>
      </div>
    ) : (
      <div>
        <span>Fetching weather...</span>
      </div>
    );
  }
}
