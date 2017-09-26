import React, {Component} from 'react'
import { Link } from 'react-router';


class Data extends Component {
  constructor(props) {
    super(props);
    this.state = {
      user: this.props.user,
      userDays: this.props.userDays,
    }
  }

  render() {
    return(
      <div className="row data">
        <h1> hello from data: {this.props.user.metric} </h1>
      </div>
    )
  }
}

export default Data;
