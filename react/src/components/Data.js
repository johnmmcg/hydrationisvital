import React, {Component} from 'react'
import { Link } from 'react-router';
import { VictoryLine, VictoryChart, VictoryAxis, VictoryTheme, VictoryLabel } from 'victory';

const data = [
  {amount: 10, day:"Mon"},
  {amount: 12, day:"Tues"},
  {amount: 9, day:"Weds"},
  {amount: 0, day:"Thurs"},
  {amount: 11, day:"Fri"}
];

class Data extends Component {
  constructor(props) {
    super(props);
    this.state = {

    }
  }

  render() {
    let recentDaysData = []
    this.props.recentDays.forEach(ud => {
      if (ud.day.id == this.props.today.id) {
        let cleanRecentDay = {amount: this.props.today.amount, day: this.props.weekdayAbbr}
        recentDaysData.push(cleanRecentDay)
      } else {
        let cleanRecentDay = {amount: ud.amount, day: ud.weekdayAbbr}
        recentDaysData.push(cleanRecentDay)
      }
    })

    return(
      <div className="row data">
        <h3> you&#39;ve been drinking this much water recently </h3>
        <h4>{this.props.user.metric}</h4>
        <VictoryChart
          padding={{ top: 40, bottom: 40, left: 50, right: 50 }}
          domainPadding={{y: 10}}
        >
        <VictoryAxis
          style={{
            axis: {stroke: ""},
            labels: {stroke: "#c1d4e2"},
            tickLabels: {fontSize: 25, padding: 10, fill: "#c1d4e2"}
          }}
        />
        <VictoryLine
          animate={{
            duration: 1000
          }}
          data={recentDaysData}
          x="day"
          y="amount"
          labels={(l) => l.y}
          style={{
            data: { stroke: "#bfffff", strokeWidth: 5},
            labels: { fontSize: 25, fill: "#c1d4e2", padding: 20 }
          }}
        />
        </VictoryChart>
      </div>
    )
  }
}

export default Data;
