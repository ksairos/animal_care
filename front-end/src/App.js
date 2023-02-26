import './App.css';
import Navbar from './components/Navbar';
import React, { useState } from 'react'
import Inputs from './components/Inputs';
import 'bootstrap/dist/css/bootstrap.css'
import Results from './components/Results';

function App() {

  const server_url = "http://127.0.0.1:5000"
  const [isLoading, setLoading] = useState(false);
  const [results, setResults] = useState({
    prediction: "No Results",
    state: "404"
  });

  return (
    <div className='App'>
      <Navbar />

      <Inputs server_url={server_url} prediction={results} />

      
    </div>
  )
}

export default App;
