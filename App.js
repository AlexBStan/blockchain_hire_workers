import React, { Component } from 'react';

import logo from './logo.svg';

import './App.css';

import { devContract } from "./setup";

import {ShowEmployee } from "./ShowEmployee";



class App extends Component {

  
 



  render() {

    return (

      <div className="App">

        <header className="App-header">

          <img src={logo} className="App-logo" alt="logo" />

          <h1 className="App-title">Welcome to Ethereum</h1>

        </header>

        <p className="App-intro">

           CV-Rating app for security developers

        </p>

        <div className="employee-table">

        <ShowEmployee></ShowEmployee>

        </div>

      </div>

    );

  }

}


export default App;