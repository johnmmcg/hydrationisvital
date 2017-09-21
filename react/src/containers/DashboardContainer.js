import React, { Component } from 'react';

class DashboardContainer extends Component {
  constructor(props) {
    super(props);
    this.state = {
      user: {},
      user_days: [],
      today: ""
    }
  }

  componentDidMount() {
    fetch(`/api/v1/users/${this.props.params.user}`)
      .then(response => {
        if (response.ok) {
          return response;
        } else {
          let errorMessage = `${response.status} (${response.statusText})`,
            error = new Error(errorMessage);
            throw(error);
        }
      })
      .then(response => response.json())
      .then(body => {
        this.setState({
          user: body.user,
          user_days: body.user_days,
          today: body.today
        })
      })

  }

  render() {

    return(
      <div className='row'>
        <div className="small-12 small-centered columns">
          <h1>{this.state.today.date}</h1>
        </div>
      </div>
    )
  }
}

export default DashboardContainer;
