import React, { Component } from "react";
import { BrowserRouter as Router } from "react-router-dom"
import { StrictMode } from "react";
import ReactDOM from "react-dom";
import Fire from "./Fire";
import Main from "./Main";
import Login from "./Login";
import "./styles.css";
import Reset from "./Reset";

// import App from "./App";

class App extends Component {
  constructor(props) {
    super(props);

    this.state = {
      user: {},
      // email:{},
      // id:{},
    };
  }

  authListener() {
    Fire.auth().onAuthStateChanged((user) => {
      if (user) {
        this.setState({ user });
        // console.log("user is:", user.email, user.uid);
        console.log({user});
        // this.showUserInfo();
      } else {
        this.setState({ user: null });
        console.log("user is null: ", user);

      }
    });
  }

  componentDidMount() {
    this.authListener();
  }

  showUserInfo(user) {
    console.log(user.email, user.uid);
  }

  render() {
    return <div>{this.state.user ? <Main user = {this.state.user} showUserInfo={this.showUserInfo}/> : <Login />}</div>;
  }
}

const rootElement = document.getElementById("root");
ReactDOM.render(
  <StrictMode>
    <Router>
      <App />
    </Router> 
  </StrictMode>,
  rootElement
);
