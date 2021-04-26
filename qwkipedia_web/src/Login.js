import React, { useState } from "react";
import Fire from "./Fire";

const Login = () => {
  const [email, setEmail] = useState("");

  const [password, setPassword] = useState("");

  const [errorMessage, setErrorMessage] = useState('');

  function handleEmailChange(event) {
    setEmail(event.target.value);
  }

  function handlePasswordChange(event) {
    setPassword(event.target.value);
  }

  function handleSubmit(event) {
    event.preventDefault();

    Fire.auth()
      .signInWithEmailAndPassword(email, password)
      .then((user) => {})
      .catch((error) => {
        setErrorMessage("Invalid Email or Password")
        console.log(error);
      });
  }

  function Register(event) {
    event.preventDefault();

    Fire.auth()
      .createUserWithEmailAndPassword(email, password)
      .then((user) => {
        console.log(user);
      })
      .catch((error) => {
        console.log(error);
        setErrorMessage(error.message);
      });
  }

  return (
    <div className="container">
      <div class="header"></div>
      <div className="bg"></div>
      <div className="header_text">QWIKIPEDIA</div>
      <div className="big-box">
        <div class="welcome-box">
          <h3 class="welcome-text">Welcome!</h3>
        </div>
        <form onSubmit={handleSubmit}>
          <div className="form-group">
            <p className="EU"> E-Mail </p>
            <i class="fa fa-envelope icon"></i>
            <input
              onChange={handleEmailChange}
              type="email"
              name="email"
              className="form-control"
              placeholder="e.g.:elonmusk@mars.com"
            />
            {errorMessage && <div className="error"> {errorMessage} </div>}

            <p className="EU"> Password </p>

            <i class="fa fa-lock" id="lock"></i>
            <input
              onChange={handlePasswordChange}
              type="password"
              name="password"
              className="form-control"
              placeholder="e.g.:abcd1234!#"
            />
          </div>
          <br></br>
          
          <button type="submit" className="btn btn-primary">
            SignIn
          </button>
          <button onClick={Register} type="button" className="btn btn-danger">
            Signup
          </button>
        </form>
      </div>
      <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
      <script src="main.js"></script>
    </div>
  );
};

export default Login;
