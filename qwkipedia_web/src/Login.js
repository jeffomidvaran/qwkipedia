import React, { useState } from "react";
import Fire from "./Fire";
import Header from "./Header";
import Home from "./Home";
import Reset from "./Reset";
import { Link } from 'react-router';
import { useRef } from 'react';


// const Login = ({sendDataToParent }) => {
const Login = () => {

  const [email, setEmail] = useState("");

  const [password, setPassword] = useState("");

  const [errorMessage, setErrorMessage] = useState('');

  function handleEmailChange(event) {
    setEmail(event.target.value);
    // EM.current = event.target.value;
    // sendDataToParent(event.target.value);
  }

  function handlePasswordChange(event) {
    setPassword(event.target.value);
  }

  // const getEmail = ()=> {
  //   console.log({email});
  // }

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
    // console.log(getEmail())

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
      <Header />
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
          {/* <Link to={Home} class="forgot-text"> Forgot Password? </Link> <br></br> */}
          <a class="forgot-text" type="bold" href="React.js"> Forgot Password? </a><br></br>

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

// export {EM};
export default Login;
