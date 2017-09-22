import React, {Component} from 'react'
import { Link } from 'react-router'

class Counter extends Component {
  constructor(props) {
    super(props);
    this.state = {
      amount: this.props.userDay.amount,
      metric: this.props.userDay.metric
    }
    this.handleAdd = this.handleAdd.bind(this)
    this.handleSubtract = this.handleSubtract.bind(this)
  }


  handleAdd(event) {
    let newAmount = this.state.amount + 1
    let amountPayload = newAmount
    this.props.changeAmount(amountPayload)
    this.setState({amount: newAmount})
  }

  handleSubtract(event) {
    if (this.state.amount < 1) {
      this.setState({error: "Drink more water"})
    } else {
      let newAmount = this.state.amount - 1
      let amountPayload = newAmount
      this.props.changeAmount(amountPayload)
      this.setState({amount: newAmount})
    }
  }

  render() {
    let error;
    if (this.state.amount <= 0) {
      error = "Drink some water!"
    }

    let goalReachAlert = ""
    if (this.state.amount >= this.props.dailyGoal) {
      goalReachAlert = "Congrats! You completed your hydration goal for today."
    }

    return(
      <div className='counter'>
        <div className="add">
          <i className="fa fa-angle-up" aria-hidden="true" onClick={this.handleAdd}></i>
        </div>
      <h1>Today: {this.state.amount} {this.state.metric} </h1>
        <div className="subtract">
          <i className="fa fa-angle-down" aria-hidden="true" onClick={this.handleSubtract}></i>
        </div>
        <p> {error} </p>
        <h3> {goalReachAlert} </h3>
      </div>
    )
  }
}

export default Counter;
