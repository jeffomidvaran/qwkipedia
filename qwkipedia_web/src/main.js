import React, { useEffect } from "react";
import { Route, Switch } from "react-router-dom";

import HeaderLogin from "./HeaderLogin";
import Home from "./Home";
import Profile from "./Profile";
import AddQwkTopic from "./AddQwkTopic";
import Navbar from "./Navbar";
import "./Qwkcontainer.css";
import QwkList from "./QwkList";
import InputQwk from "./InputQwk";
import QwkContainer from "./Qwkcontainer";

import {showUserInfo} from './index';
import "./Qwkcontainer.css";
import "./styles.css";

const Main = (props) => {

  // const [user, setUser] = useEffect("");
  // function authListener() {
  //   Fire.auth().onAuthStateChanged((user) => {
  //     if (user) {
  //       setUser( user );
  //       // console.log("user is:", user.email, user.uid);
  //       // console.log({user});
  //       showUserInfo();
  //     } 
  //   });
  // }

  // function componentDidMount() {
  //   this.authListener();
  // }

  // function showUserInfo() {
  //   console.log(user.user.email, user.user.uid);
  // }
  const showUserInfo = (user) => {
    props.showUserInfo(user);
  }
    return (
       
        <>
        {showUserInfo(props.user)}
        <HeaderLogin />
        <Navbar />
        <Switch>
        <Route exact path="/">
          <div>
          <Home

          />
          </div>
        </Route>
        <Route path="/profile">
          <Profile />
        </Route>
        <Route path="/addQwkTopic">
          <AddQwkTopic />
        </Route>
        </Switch>
      </>
      )
}

export default Main