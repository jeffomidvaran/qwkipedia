import React, { useState } from "react";
import Fire from "./Fire";
import Header from "./Header";
import qwkLogo from './images/qwkLogoFont.png'



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
      <div className="WelcomeBox">
        <div>
          <img src={qwkLogo} alt="Logo" className="qwkLogoImage" />
          <h3 className="welcomeText">
            Welcome back
          </h3>
        </div>
        <form onSubmit={handleSubmit}>
          <div >
            <input
              onChange={handleEmailChange}
              type="email"
              name="email"
              className="form-control"
              placeholder="Email"
            />
            <br></br>
            <input
              onChange={handlePasswordChange}
              type="password"
              name="password"
              className="form-control"
              placeholder="Password"
            />
            {errorMessage && <div className="invalidEmailOrPasswordMessage"> {errorMessage} </div>}
          </div>

          <br></br>
          {/* <a class="forgot-text" href="React.js"> Forgot Password? </a><br></br> */}
          <a href="index.js" className="loginPageForgotPasswordButton"> Forgot Password? </a><br></br>
          <br></br>

          <button type="submit" className="loginPurpleButton">
            Sign In
          </button>
          {/* <button onClick={Register} type="button" className="btn btn-danger"> */}
          <button onClick={Register} type="button" className="loginPurpleButton">
            Create Account
          </button>
        </form>
      </div>
      <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
      {/* <script src="error.js"></script> */}
    </div>
  );
};

// export {EM};
export default Login;
