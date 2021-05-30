import React, {useState,useEffect} from "react";
// import { BrowserRouter as Router } from "react-router-dom"

// import HeaderLogin from "./HeaderLogin";
// import QwkContainer from "./Qwkcontainer";
import Fire from './Fire';
import {db} from './Fire';
// import homeContainer from './homeContainer';
import logo from './logo.svg'

import "./styles.css";

// import "./Home.css";
const topicList = document.querySelector('#topic-list');

const Home = () => {
  // function Logout() {
  //   Fire.auth().signOut();
  // }

  const [topics, setTopics] = useState();
  const [image1, setImage] = useState();
  // const topicsRef = db.collection('topics-v2').limit(3)

function renderTopic(doc) {
  let li = document.createElement('li');
  let title = document.createElement('span');
  let desc = document.createElement('span');
  // let image = document.createElement('img');

  li.setAttribute('data-id', doc.id);
  title.textContent = doc.data().title;
  desc.textContent = doc.data().topDesc;
  fetchImages(doc, li);
  // image=image1;

  // li.appendChild(image1)
  li.appendChild(title);
  li.appendChild(desc);
  topicList.appendChild(li);
}

const fetchImages = (doc,li) => {
  let imageRef = Fire.storage().ref("/topicImages/"+doc.data().title+".png");
  console.log("/topicImages/"+doc.data().title+".png");
  imageRef
    .getDownloadURL()
    .then((url) => {
      setImage(url);
      console.log(image1)
      // var _img = document.createElement('img');
      // _img.src="url";
      // _img.alt="logo";
      // li.appendChild(_img);
    })
    .catch((e) => console.log('getting downloadURL of image error => ', e));
}

  const fetchTopics = async() => {
  //   // return db.collection('topics-v2').onSnapshot((snapsot) => {
  //   //   const topicsData = [];
  //   //   snapsot.forEach((doc) => topicsData.push({ ...doc.data(), id: doc.id}));
  //   //   console.log(topicsData);
  //   //   setTopics(topicsData);
  //   // })
  //   // const topicsData = await db.collection('topics-v2').limit(3).get();
  //   // return topicsData.docs.map(doc => doc.data());
  //   const doc = await topicsRef.get().then((querySnapshot) => {
  //     const tempDoc = []
  //     querySnapshot.forEach((doc) => {
  //        tempDoc.push({ id: doc.id, ...doc.data() })
  //     })
  //     // console.log(tempDoc);
  //     setTopics(tempDoc);
  //  })
    db.collection('topics-v2').limit(7).get().then((snapshot) => {
      snapshot.docs.forEach(doc => {
        renderTopic(doc);
      })
    })
  }



  useEffect(() => {
    fetchTopics();
    console.log("Setting done!")
    // console.log(topics[0].data())
    // topics.docs.forEach(doc => [
    //   console.log(doc.data())
    // ])
    // setTopics(fetchTopics());
    // console.log(topics)

  })


  return (
    <div className="home1">
    {/* <HeaderLogin /> */}
    
    {/* <button type="submit" onClick={Logout} className="btn btn-danger">
        Logout
      </button> */}
    {/* <br></br><br></br><br></br><br></br> */}
    <h1>&emsp;&ensp;&nbsp;Home Page</h1>
    
    <div className="big-box1">
      {/* <homeContainer 
        topics={topics}
      /> */}
      <ul id="topic-list"></ul>
    </div>
    </div>
  );
};

export default Home;
