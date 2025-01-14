import { useState } from "react";
import "./App.css";

function App() {
  const [guessResult, setGuessResult] = useState(false);
  const colours = ["Red", "Blue", "Green", "Orange", "Purple", "Yellow"];

  return (
    <div className="App">
      <h1>Mastermind</h1>

      <div>
        <p>Available Colours: {colours.join(", ")}</p>
      </div>

      {guessResult && (
        <div>
          <p>Wrong Guess</p>
        </div>
      )}
      <button onClick={() => setGuessResult(true)}>Guess</button>
    </div>
  );
}

export default App;
