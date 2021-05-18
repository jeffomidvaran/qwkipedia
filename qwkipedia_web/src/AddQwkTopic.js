import React from "react";
// import { BrowserRouter as Router } from "react-router-dom"

// import HeaderLogin from "./HeaderLogin";
import QwkContainer from "./Qwkcontainer";
import "./styles.css";
import "./AddQwkTopic.css";
const AddQwkTopic = () => {
    // function Logout() {
  //   Fire.auth().signOut();
  // }

  return (
    <div className="home1">
    {/* <HeaderLogin /> */}
    
    {/* <button type="submit" onClick={Logout} className="btn btn-danger">
        Logout
      </button> */}
    {/* <br></br><br></br><br></br><br></br> */}
    <h1>&emsp;&ensp;&nbsp;AddQwkTopic</h1>
    
    <div className="big-box1">
        <QwkContainer />
    </div>
    </div>
  );
};

export default AddQwkTopic