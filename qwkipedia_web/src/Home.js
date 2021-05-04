import React from "react";
import HeaderLogin from "./HeaderLogin";
import QwkContainer from "./Qwkcontainer";
import "./styles.css";
import "./Home.css";
const Home = () => {
  // function Logout() {
  //   Fire.auth().signOut();
  // }

  return (
    <div>
    <HeaderLogin />
    
    {/* <button type="submit" onClick={Logout} className="btn btn-danger">
        Logout
      </button> */}
    <br></br><br></br><br></br><br></br>
    <h1>&emsp;&ensp;&nbsp;Home Page</h1>

    <div className="big-box1">
      <QwkContainer />

    </div>
    </div>
  );
};

export default Home;
