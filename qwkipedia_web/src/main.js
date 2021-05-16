import React from "react";
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
import "./Qwkcontainer.css";
import "./styles.css";

const Main = () => {
    return (
        <>
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