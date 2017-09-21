import React from 'react';
import { Router, browserHistory, Route, IndexRoute } from 'react-router';
import Welcome from './components/Welcome'
import NavBar from './components/NavBar';
import DashboardContainer from './containers/DashboardContainer'

const App = (props) => {
  return (
    <Router history={browserHistory} >
        <Route exact path='/' component={Welcome}>
        </Route>
        <Route path='/users/:user' component={NavBar} >
          <IndexRoute component={DashboardContainer} />
        </Route>
    </Router>
  )
}

export default App;
