import React, { Component } from 'react';
import { Link } from 'react-router'

class Calculator extends Component {
  constructor(props) {
    super(props);
    this.state = {
      weight: "",
      dailyGoal: 0
    }
    this.handleWeightChange = this.handleWeightChange.bind(this)
  }

  handleWeightChange(event) {
    console.log(event.target.value);
    let newWeight = event.target.value
    this.setState({ weight: newWeight })
    let dailyGoal = Math.round(((newWeight/2)/8))
    this.setState({ dailyGoal: dailyGoal })
  }

  render() {
    return (
      <div className="calculator">
        <div className="row">
          <form>
            <div className="small-6 medium-6 columns animated fadeInLeft">
              <label>
                your body weight
              </label>
              <input
                type="text"
                value={this.state.weight} onChange={this.handleWeightChange}
                placeholder='0'
              />
            </div>
          </form>
          <div className="small-6 medium-5 small columns animated fadeInRight">
            <h3> you should drink </h3>
            <h4> {this.state.dailyGoal} cups/day </h4>
          </div>
        </div>
      </div>
    );
  }

}

export default Calculator;
