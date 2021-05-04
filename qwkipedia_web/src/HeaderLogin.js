import React from "react"
import Fire from "./Fire";
import "./HeaderLogin.css";
import "./styles.css";

const HeaderLogin = () => {
  function Logout() {
    Fire.auth().signOut();
  }

  return (
    
    <header>
      <div className="header"></div>
      <div className="bg"></div>

      <div className="header_text">QWIKIPEDIA &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp;
        <button type="submit" onClick={Logout} className="btn btn-danger btn-logout">
          Logout
        </button>
      </div>
    </header>
  )
}
export default HeaderLogin