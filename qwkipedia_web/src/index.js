import React, { Component } from "react";
import { StrictMode } from "react";
import ReactDOM from "react-dom";
import Fire from "./Fire";
import Home from "./Home";
import Login from "./Login";
import "./styles.css";
// import App from "./App";

class App extends Component {
  constructor(props) {
    super(props);

    this.state = {
      user: {},
    };
  }

  authListener() {
    Fire.auth().onAuthStateChanged((user) => {
      if (user) {
        this.setState({ user });
      } else {
        this.setState({ user: null });
      }
    });
  }

  componentDidMount() {
    this.authListener();
  }

  render() {
    return <div>{this.state.user ? <Home /> : <Login />}</div>;
  }
}

const rootElement = document.getElementById("root");
ReactDOM.render(
  <StrictMode>
    <App />
  </StrictMode>,
  rootElement
);
