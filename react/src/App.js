import React from 'react';
import { Router, browserHistory, Route, IndexRoute } from 'react-router';
import NavBar from './components/NavBar';
import DashboardContainer from './containers/DashboardContainer'

const App = (props) => {
  return (
    <Router history={browserHistory} >
      <Route path='/' component={NavBar} >
        <IndexRoute component={DashboardContainer} />
      </Route>
    </Router>
  )
}

export default App;
