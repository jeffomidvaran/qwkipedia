import Fire from './Fire';
import { db } from './Fire';
import React, { useState, useEffect } from 'react';
import getYouTubeID from 'get-youtube-id';
import YoutubeEmbed from "./YoutubeEmbed";

function DataBase() {
  const [blogs, setBlogs] = useState([])
  const [videoId, setVideoId] = useState("")
  const [image1, setImage] = useState("")
  const [description, setDescription] = useState("")
  const [title, setTitle] = useState("Puppy")
  const fetchBlogs = async () => {
    const response = db.collection('users').doc('testUser1');
    const data = await response.get();
    if (!data.exists) {
      console.log("no such doc!")
    } else {
      // console.log("doc data:", data.data());
      console.log("Doc Found!")
    }

    const video = db.collection('videos').doc('puppyVideoData1');
    const vdata = await video.get();
    if (!vdata.exists) {
      console.log("no such video!")
    } else {
      var videoLink = vdata.data()['youTubeURL'];
      console.log("video link: ", videoLink);
      var videoId1 = getYouTubeID(videoLink);
      console.log(videoId1);
      setVideoId(videoId1);
    }

    const des = db.collection('topics-v2').doc('Puppy')
    const desData = await des.get();
    if (!desData.exists) {
      console.log("no such topic!")
    } else {
      var descrip = desData.data()['topDesc'];
      // console.log(descrip);
      setDescription(descrip);
    }

    // data.doc.forEach(item=>{
    //     setBlogs([...blogs, item.data()])
    // })
  }

  const fetchImages = () => {
    let imageRef = Fire.storage().ref("/topicImages/puppy.png");
    imageRef
      .getDownloadURL()
      .then((url) => {
        setImage(url);
        console.log(url);
        console.log(image1)
      })
      .catch((e) => console.log('getting downloadURL of image error => ', e));
  }

  useEffect(() => {
    fetchBlogs();
    fetchImages();
  }, [])

  return (
    <div className="App">

      <br></br>
      <div><h1>{title}</h1></div>
      <div>{description}</div>
      <br></br>
      {/* {videoId} */}
      <div>
        <img src={image1} width="400" height="300" />
      </div>
      <br></br>

      <YoutubeEmbed embedId={videoId} />
      
      <div className="externalLinksList">
        <ol>
          <li><a className="buttonColor" href="https://www.petfinder.com/pet-adoption/dog-adoption/puppies-for-adoption/"> PetFinder.com </a> <br></br></li>
          <li><a className="buttonColor" href="https://www.thesprucepets.com/puppies-4162145"> TheSprucePets.com </a> <br></br></li>
          <li><a className="buttonColor" href="https://www.puppyspot.com"> ThePuppySpot.com </a> <br></br></li>
        </ol>
      </div> 
    </div>
  );
}

export default DataBase;