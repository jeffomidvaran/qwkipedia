import React, { useEffect, useState } from "react";
import QwkContainer from "./Qwkcontainer";
import Login from "./Login";

const email = () => {
    const [em, setEmail] = useState("");

    const sendEmailToParent = (em) => {
        // setEmail(em)
        console.log({em})
        console.log("email")
    }

    // const getEm = () => {
    //     return em
    // }
    return (
        <div>
        <Login 
            sendEmailToParent={sendEmailToParent}/>
        <QwkContainer 

        />
        </div>
    )
}

export default email