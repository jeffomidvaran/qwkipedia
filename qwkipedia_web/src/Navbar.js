import React from "react";
import { NavLink } from "react-router-dom";
import "./Navbar.css";

const Navbar = () => {
  const links = [
    {
      id: 1,
      path: "/",
      text: "Home",
    },
    {
      id: 2,
      path: "/profile",
      text: "Profile",
    },
  ]

  return (
    <div className="navBar1">
      <nav>
        <ul >
          {links.map(link => {
            return (
              <li key={link.id} >
                <NavLink 
                  className = "navLinks" 
                  activeClassName="active-link" 
                  to={link.path} 
                  exact> {link.text}
                </NavLink>
              </li>
            )
          })}
        </ul>
      </nav>
    </div>
  )
}
export default Navbar