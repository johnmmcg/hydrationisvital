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
    this.handleAddTen = this.handleAddTen.bind(this)
    this.handleSubtractTen = this.handleSubtractTen.bind(this)
  }

  componentDidMount() {
    let percent = Math.round((this.state.amount / this.state.dailyGoal) * 100)
    this.setState({percent: percent})
  }

  handleAddTen(event) {
    let newAmount = this.state.amount + 10
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

  handleSubtractTen(event) {
    if (this.state.amount - 10 < 1) {
      let newAmount = 0
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
      this.setState({amount: 0})
      this.setState({lastPercent: this.state.percent})
      this.setState({percent: percent})
    } else {
      let newAmount = this.state.amount - 10
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
      <div>
        <div className="row">
          <div className="small-12 small-centered columns flash animated fadeInUp">
            <h3> {error} </h3>
            <h3> {goalReachAlert} </h3>
          </div>
        </div>

        <div className='row align-center counter animated fadeIn'>
          <div className="row">

            <div className='small-4 columns'>
              <h2 className="today">Today: </h2>
            </div>

            <div className="small-4 columns centerpiece">
              <div className="add">
                <i className="fa fa-angle-up ten" aria-hidden="true" onClick={this.handleAddTen}></i>
                  <br/>
                <i className="one fa fa-angle-up" aria-hidden="true" onClick={this.handleAdd}></i>
              </div>

              <h1> {this.state.amount} </h1>

              <div className="subtract">
                <i className="one fa fa-angle-down" aria-hidden="true" onClick={this.handleSubtract}></i>
                <br/>
              <i className="fa fa-angle-down ten" aria-hidden="true" onClick={this.handleSubtractTen}></i>
            </div>
          </div>

          <div className="small-4 columns">
            <h2 className="metric"> {this.state.metric} </h2>
          </div>

        </div>



          <div className="row percent">
            <div className="small-5 columns goal">
              <h3>Daily Goal :</h3>
              <h4>({this.state.dailyGoal} {this.state.metric})</h4>
            </div>
            <div className="small-7 columns number">
              <h1>{percentCounter}%</h1>
            </div>
          </div>
        </div>
      </div>
    )
  }
}

export default Counter;
