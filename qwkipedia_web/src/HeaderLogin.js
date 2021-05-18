import React from "react"
import Fire from "./Fire";
import "./HeaderLogin.css";
import "./styles.css";

const HeaderLogin = () => {
  function Logout() {
    Fire.auth().signOut();
  }

  return (
    
    // <header>
    <div >
      <div className="header1"></div>
      <div className="bg"></div>

      <div className="header_text">QWKIPEDIA &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp;
        <button type="submit" onClick={Logout} className="btn btn-danger btn-logout">
          Logout
        </button>
      </div>
    </div>
    // </header>
  )
}
export default HeaderLogin