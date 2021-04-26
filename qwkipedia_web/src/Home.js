import React from "react";
import Fire from "./Fire";

const Home = () => {
  function Logout() {
    Fire.auth().signOut();
  }

  return (
    <div>
      <h1>Home</h1>
      <button type="submit" onClick={Logout} className="btn btn-danger">
        Logout
      </button>
    </div>
  );
};

export default Home;
