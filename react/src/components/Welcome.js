import React from 'react';
import { Link } from 'react-router';

const Welcome = props => {
  return(
    <div>
      <h1>Welcome!</h1>
      {props.children}
    </div>
  )
}

export default Welcome;
