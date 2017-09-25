import React from 'react';
import { Link } from 'react-router';

const Welcome = props => {
  return(
    <div className="welcome animated fadeInUp">
      <h2> hydration is vital. </h2>
      <p> welcome text. hydration info/facts. why of the site. </p>
      {props.children}
    </div>
  )
}

export default Welcome;
