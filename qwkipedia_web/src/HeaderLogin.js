import React from "react"
import Fire from "./Fire";
// import "./HeaderLogin.css";
import "./styles.css";
import qwkLogo from './images/qwkLogoFont.png'

const HeaderLogin = () => {
  function Logout() {
    Fire.auth().signOut();
  }

  return (
    <div >
      <div className="headerBackground"></div>
      <div className="header_text"> 
        <img src={qwkLogo} alt="Logo" className="qwkLogoImageHeader" />
        
        <button type="submit" 
          onClick={Logout} 
          className="logoutButton"> Log Out 
        </button>

      </div>
    </div>
  )
}
export default HeaderLogin