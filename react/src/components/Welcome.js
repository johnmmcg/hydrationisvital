import React from 'react';
import { Link } from 'react-router';
import Calculator from './Calculator';

const Welcome = props => {
  return(
    <div className="row">
      <div className="small-12 small-centered columns welcome animated fadeInUp">
        <h2> hydration is vital. </h2>
        <p>You need water. Dehydration is one of the causes of tiredness, headaches, and indigestion.</p>

        <p>Vital Hydration Tracker is a tool created to help people live healthier lives by being mindful of their water consumption.</p>

        <div className="info">
          <img src="http://weightlossdiet101.com/wp-content/uploads/2016/02/howmuchwater.jpg" />

          <h3>how much water should I drink?</h3>

          <img src="https://i.pinimg.com/originals/2e/1d/05/2e1d0582a3da2413199e38b9eb14dcf9.png" />
        </div>

        <br/>

        <Calculator />

        <h3>
          <a href="/users/sign_up" className="animated fadeIn">start tracking</a>
        </h3>
        {props.children}
      </div>
    </div>
  )
}

export default Welcome;
