import React from 'react';
import { Link } from 'react-router';

const NavBar = props => {
  return(
    <div className="NavBar">
      <Link to='/'>Vital</Link>
      {props.children}
    </div>
  )
}

export default NavBar;
