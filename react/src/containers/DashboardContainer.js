import React, { Component } from 'react';
import Counter from '../components/Counter'

class DashboardContainer extends Component {
  constructor(props) {
    super(props);
    this.state = {
      user: {},
      user_days: [],
      today: {}
    }
    this.changeAmount = this.changeAmount.bind(this)
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

  changeAmount(amountPayload) {
  fetch(`/api/v1/user_days/${this.state.today.id}`, {
    credentials: 'same-origin',
    method: 'PATCH',
    body: JSON.stringify(amountPayload)
  })
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
      today: body.today
    })
  })
}

  render() {
    return(
      <div className='row animated fadeInUp dashboardContainer'>
        <div className='row date'>
            <div className="small-6 columns">
              <h1>happy {this.state.today.weekday}</h1>
            </div>
            <div className="small-6 columns">
              <h2> {this.state.today.date} </h2>
            </div>
        </div>
        <div className='row counterContainer'>
          <div className="small-12 small-centered columns">
            <Counter
              key={this.state.user.id}
              user={this.state.user}
              userDay={this.state.today}
              dailyGoal={this.state.user.daily_goal}
              changeAmount={this.changeAmount}
            />
          </div>
        </div>
      </div>
    )
  }
}

export default DashboardContainer;
