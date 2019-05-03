import React from 'react';
import { NavLink } from 'react-router-dom';

const NavBar = () =>
  <div className="navbar">
    <NavLink
        to="/"
        exact
        >Home
    </NavLink>
    <br/>
    <NavLink
        to="/login"
        exact
         >Login
    </NavLink>
    <br/>
    <NavLink
        to="/signup"
        exact
         >Sign Up
    </NavLink>

  </div>

export default NavBar
