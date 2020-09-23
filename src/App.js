import React from 'react';
import './App.css';
import MainApp from './components/mainApp';
import Home from './components/Home';
import {
  BrowserRouter as Router,
} from "react-router-dom";

function App() {
  return (
    <Router>
    <div className="App">
      <Home />
    </div>
    </Router>
  );
}

export default App;
