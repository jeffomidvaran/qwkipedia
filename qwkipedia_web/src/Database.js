import Fire from './Fire';
import {db} from './Fire';
import React,{useState,useEffect} from 'react';
import getYouTubeID from 'get-youtube-id';
import YoutubeEmbed from "./YoutubeEmbed";

function DataBase() {
    const [blogs, setBlogs] = useState([])
    const [videoId, setVideoId] = useState("")
    const [image1, setImage] = useState("")
    const [description, setDescription] = useState("")

    const fetchBlogs = async() => {
        const response = db.collection('users').doc('testUser1');
        const data = await response.get();
        if (!data.exists) {
          console.log("no such doc!")
        } else {
          console.log("doc data:", data.data());
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
          var descrip = desData.data()['descriptions'][0]['body'];
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
          <div>{description}</div>
          <br></br>
          {/* {videoId} */}
          <div>
          <img src={image1} width="400" height="300" />
          </div>
          <br></br>

          <YoutubeEmbed embedId={videoId} /> 
          {/* {
            blogs && blogs.map(blog=>{
              return(
                <div className="blog-container">
                  <h4>{blog.title}</h4>
                  <p>{blog.body}</p>
                </div>
              )
            })
          } */}
        </div>
      );
}

export default DataBase;