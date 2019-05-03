import React from 'react';
import './App.css';
import { BrowserRouter as Router, Route } from 'react-router-dom';
import NavBar from './components/NavBar';
import Home from './components/Home';
import Login from './components/Login'
import SignUp from './components/SignUp'

class App extends React.Component {

  state = {
    users: [],
    groups: []
  }

  componentDidMount(){
    fetch('http://localhost:3000/users')
      .then(resp => resp.json())
      .then(users => {
        this.setState({
          users })
  })
  fetch('http://localhost:3000/groups')
    .then(resp => resp.json())
    .then(groups => {
      this.setState({
        groups })
 })
}

  render() {
  return (
    <Router>
      <NavBar  />
        <div>
          <Route path="/" component={Home} />
          <Route exact path="/login" component={Login} />
          <Route exact path="/signup" component={SignUp} />
        </div>
    </Router>
    )}
  }


export default App;
