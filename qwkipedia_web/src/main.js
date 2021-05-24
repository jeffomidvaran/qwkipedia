import React, { useEffect } from "react";
import { Route, Switch } from "react-router-dom";

import HeaderLogin from "./HeaderLogin";
import Home from "./Home";
import Profile from "./Profile";
import AddQwkTopic from "./AddQwkTopic";
import Navbar from "./Navbar";
import "./Qwkcontainer.css";
import Image from "./Image";
import Video from "./Video";
import Database from "./Database";
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
          <Profile 
            email={props.user.email}
            uid={props.user.uid}
          />
        </Route>
        <Route path="/addQwkTopic">
          <AddQwkTopic />
        </Route>
        <Route path="/image">
          <Image />
        </Route>
        <Route path="/video">
          <Video />
        </Route>
        <Route path="/database">
          <Database />
        </Route>
        </Switch>
      </>
      )
}

export default Main