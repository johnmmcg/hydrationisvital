import React, {Component} from 'react'
import { Link } from 'react-router'
import CountUp from 'react-countup';


class Counter extends Component {
  constructor(props) {
    super(props);
    this.state = {
      amount: this.props.userDay.amount,
      metric: this.props.userDay.metric,
      dailyGoal: this.props.user.daily_goal,
      lastPercent: 0,
      percent: null
    }
    this.handleAdd = this.handleAdd.bind(this)
    this.handleSubtract = this.handleSubtract.bind(this)
  }

  componentDidMount() {
    let percent = Math.round((this.state.amount / this.state.dailyGoal) * 100)
    this.setState({percent: percent})
  }


  handleAdd(event) {
    let newAmount = this.state.amount + 1
    let amountPayload = newAmount
    this.props.changeAmount(amountPayload)
    let percent = Math.round((newAmount / this.state.dailyGoal) * 100)
    let percentCounter =
      <CountUp
        className="percent"
        duration={2}
        start={this.state.percent}
        end={percent}
        useEasing={true}
      />
    this.setState({amount: newAmount})
    this.setState({lastPercent: this.state.percent})
    this.setState({percent: percent})
  }

  handleSubtract(event) {
    if (this.state.amount < 1) {
      this.setState({error: "Drink more water"})
    } else {
      let newAmount = this.state.amount - 1
      let amountPayload = newAmount
      this.props.changeAmount(amountPayload)
      let percent = Math.round((newAmount / this.state.dailyGoal) * 100)
      let percentCounter =
        <CountUp
          className="percent"
          duration={2}
          start={this.state.percent}
          end={percent}
          useEasing={true}
        />
      this.setState({amount: newAmount})
      this.setState({lastPercent: this.state.percent})
      this.setState({percent: percent})
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

    let percentCounter = <CountUp
        className="amount"
        duration={2}
        start={this.state.lastPercent}
        end={this.state.percent}
        useEasing={true}
      />

    return(
      <div className='counter animated fadeInUp'>
      <h2>Today: </h2>
        <div className="add">
          <i className="fa fa-angle-up" aria-hidden="true" onClick={this.handleAdd}></i>
        </div>

        <h1> {this.state.amount} </h1>

        <div className="subtract">
          <i className="fa fa-angle-down" aria-hidden="true" onClick={this.handleSubtract}></i>
        </div>

      <h2> {this.state.metric} </h2>
        <p> {error} </p>
        <h3> {goalReachAlert} </h3>
        <h4> Progress: {percentCounter}% </h4>
      </div>
    )
  }
}

export default Counter;
