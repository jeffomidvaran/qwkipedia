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
    // {
    //     id: 3,
    //     path: "/addQwkTopic",
    //     text: "AddQwkTopic",
    // },
    // {
    //     id: 4,
    //     path: "/image",
    //     text: "Image",
    // },
    // {
    //     id: 5,
    //     path: "/video",
    //     text: "Video",
    // },
    // {
    //     id: 6,
    //     path: "/database",
    //     text: "Database",
    // },
    ]
    return (
      <div className="navBar1">
        <nav>
          <ul>
            {links.map(link => {
              return (
                <li key={link.id}>
                  <NavLink to={link.path} activeClassName="active-link" exact>
                    {link.text}
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