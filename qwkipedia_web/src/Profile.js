import React from "react";
import PropTypes from 'prop-types';
import ProfileArea from "./ProfileArea";
// import { BrowserRouter as Router } from "react-router-dom"

// import HeaderLogin from "./HeaderLogin";

import "./styles.css";
const Profile = (props) => {

  return (
    <div>

    {/* <h1>&emsp;&ensp;&nbsp;Profile</h1> */}
    <ProfileArea 
      username="peter"
      emailAddress={props.email}
      uid={props.uid}
    />

    </div>
  );
};

Profile.PropTypes = {

};
export default Profile