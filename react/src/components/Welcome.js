import React from 'react';
import { Link } from 'react-router';

const Welcome = props => {
  return(
    <div className="row">
      <div className="small-12 small-centered columns welcome animated fadeInUp">
        <h2> hydration is vital. </h2>
        <p> You need water. Dehydration is one of the number one reasons for tiredness, headaches, and indigestion. Vital Hydration Tracker is a tool created to help people live healthier lives by being mindful of their water consumption. </p>
        {props.children}
      </div>
    </div>
  )
}

export default Welcome;
