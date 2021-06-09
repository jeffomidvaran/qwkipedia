import React from 'react';
import PropTypes from 'prop-types';
import Fire from "./Fire";

import "./styles.css";

const ProfileArea = (props) => {
  return (
    <div>
      {/* <h1>&emsp;Profile for {props.username}</h1> */}
      <h1> &emsp;Profile</h1>
      <div className="profileItems"> 
        <ul>
          <li><b>User Name:</b> {props.username}</li>
          <li><b>Email Address:</b> {props.emailAddress}</li>
          <li><b>UID:</b> {props.uid}</li>
        </ul>
      </div>
    </div>
  )
};

ProfileArea.propTypes = {
  username: PropTypes.string.isRequired,
  emailAddress: PropTypes.string.isRequired
};

export default ProfileArea;