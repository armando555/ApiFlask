import logo from './logo.svg';
import './App.css';

function App() {
  return (
    <div className="App">
      <header className="App-header">
        <img src={logo} className="App-logo" alt="logo" />
        <p>
          HELLO WORLD
        </p>
        <a
          className="App-link"
          href="http://test.micheckpoint.com"
          target="_blank"
          rel="noopener noreferrer"
        >
          test.micheckpoint.com
        </a>
      </header>
    </div>
  );
}

export default App;
