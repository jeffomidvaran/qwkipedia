import React, {useState,useEffect} from "react";
// import { BrowserRouter as Router } from "react-router-dom"

// import HeaderLogin from "./HeaderLogin";
// import QwkContainer from "./Qwkcontainer";
import Fire from './Fire';
import {db} from './Fire';
import HomeContainer from './HomeContainer';
import logo from './logo.svg'
import { Link, NavLink } from "react-router-dom";

import "./styles.css";
import { v4 as uuidv4 } from "uuid";

// import "./Home.css";
// const topicList = document.querySelector('#topic-list');

const Home = () => {
  // function Logout() {
  //   Fire.auth().signOut();
  // }

  // const [topics, setTopics] = useState();
  const ima = [];
  // const [image1, setImage] = useState();
  const [images, setImages] = useState([]);
  // const topicsRef = db.collection('topics-v2').limit(3)
  var clickTitle = ""


function renderTopic(doc, topicList) {
  let li = document.createElement('li');
  let title = document.createElement('span');
  let desc = document.createElement('span');
  // let image = document.createElement('img');

  li.setAttribute('data-id', doc.id);
  title.textContent = doc.data().title;
  desc.textContent = doc.data().topDesc;
  console.log(title)
  // const imgs = [];
  // fetchImages(doc);
  // console.log(images)
  // image=image1;
  
  // li.appendChild(image1)
  li.appendChild(title);
  li.appendChild(desc);
  topicList.appendChild(li);
}



const fetchImages = async(doc, imageList) => {
  let imageRef = await Fire.storage().ref("/topicImages/"+doc.data().title+".png").getDownloadURL();
  // let imageRef = Fire.storage().ref("/topicImages/puppy.png");
  console.log(imageRef)
  imageList.push(imageRef.toString())
  // let img1 = document.createElement('img')
  // img1.src = imageRef.toString();
  // imageList.appendChild(img)
  ima.push(imageRef.toString())
  const newImg = {
    id: uuidv4(),
    url: imageRef.toString(),
    title: doc.data().title,
  }
  setImages(img=>[...img, newImg])
  // console.log("/topicImages/"+doc.data().title+".png");
  // imageRef
  //   .getDownloadURL()
  //   .then((url) => {
  //     imageList.push(url.toString())
  //     // console.log(url);
  //     // console.log(image1)
  //     // imgs.push(url);
  //     // setImages(imgs);
  //     // var _img = document.createElement('img');
  //     // _img.src="url";
  //     // _img.alt="logo";
  //     // li.appendChild(_img);
  //     // console.log(imageList[0])
  //     ima.push(url)
  //     console.log(ima)
  //   })
  //   .catch((e) => console.log('getting downloadURL of image error => ', e));
}

  const fetchTopics = async(topicList, imageList) => {
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
    // if (images) {
    //   setImages([])
    // }
    if (topicList){
      db.collection('topics-v2').limit(7).get().then((snapshot) => {
        snapshot.docs.forEach(doc => {
          renderTopic(doc, topicList);
          fetchImages(doc, imageList);
        })
      })
    }else {
      topicList = document.querySelector('#topic-list');
      db.collection('topics-v2').limit(7).get().then((snapshot) => {
        snapshot.docs.forEach(doc => {
          renderTopic(doc, topicList);
          fetchImages(doc, imageList);
        })
      })
    }
    console.log(imageList)
    console.log(ima)
    console.log(images)
  }

  // useEffect(() => {
  //   // fetchTopics();
  //   // console.log("Setting done!")
  //   // console.log({images});
  //   // console.log(topics[0].data())
  //   // topics.docs.forEach(doc => [
  //   //   console.log(doc.data())
  //   // ])
  //   // setTopics(fetchTopics());
  //   // console.log(topics)

  // }, [topics])

  return (
    <div className="home1">

    <h1>&emsp;&ensp;&nbsp;Home Page</h1>
    
    <HomeContainer 
      fetchTopics={fetchTopics}
      renderTopic={renderTopic}
      // topicList={topicList}
    />
      <div className="image-content">{images.sort((a,b)=>a.title > b.title ? 1:-1).map( e=> 
      <li key={e.id}>
      <NavLink to="/Database">
        <img src={e.url} width="90%" ></img>
      </NavLink>
      </li>
      )}
      </div>

    </div>
  );
};

export default Home;
