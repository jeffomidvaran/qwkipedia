import React, {useState,useEffect} from "react";
import Fire from './Fire';
import {db} from './Fire';
import HomeContainer from './HomeContainer';
import { Link, NavLink } from "react-router-dom";
import { v4 as uuidv4 } from "uuid";

import "./styles.css";
import "./Home.css";

const Home = () => {
  const ima = [];
  const [images, setImages] = useState([]);

function renderTopic(doc, topicList) {
  let li = document.createElement('li');
  let title = document.createElement('span');
  title.style.fontWeight = "bold";
  title.style.fontSize = "130%";
  let desc = document.createElement('span');

  li.setAttribute('data-id', doc.id);
  title.textContent = doc.data().title;
  desc.textContent = doc.data().topDesc;
  // console.log(title)
  
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

const recordTitle=(title)=>{
  console.log("!!!!!")
  console.log(title)
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

  return (
    // <div className="home1">
    <div >
      <h1>&emsp;Home</h1>
      <HomeContainer 
        fetchTopics={fetchTopics}
        renderTopic={renderTopic}
      />

      <div className="image-content">{images.sort((a,b)=>a.title > b.title ? 1:-1).map( e=> 
        <li key={e.id}>
          <NavLink to="/Database">
            <img src={e.url} width="90%" onClick={recordTitle(e.title)}></img>
          </NavLink>
        </li>
      )}
      </div>
    </div>
  );
};

export default Home;
