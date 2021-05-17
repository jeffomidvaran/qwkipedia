import React from 'react';
import PropTypes from 'prop-types';
import Fire from "./Fire";

import "./styles.css";

const ProfileArea = (props) => {
  return (
    <div>
      <h1>Profile for {props.username}</h1>

      <ul>
        <li>Email address: {props.emailAddress}</li>
      </ul>
    </div>
  )
};

ProfileArea.propTypes = {
  username: PropTypes.string.isRequired,
  emailAddress: PropTypes.string.isRequired
};

export default ProfileArea;