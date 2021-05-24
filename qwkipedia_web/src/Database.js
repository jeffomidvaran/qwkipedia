import Fire from './Fire';
import {db} from './Fire';
import React,{useState,useEffect} from 'react';
import getYouTubeID from 'get-youtube-id';

function DataBase() {
    const [blogs, setBlogs] = useState([])
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
          var videoId = getYouTubeID(videoLink);
          console.log(videoId);
        }
        // data.doc.forEach(item=>{
        //     setBlogs([...blogs, item.data()])
        // })
    }

    useEffect(() => {
        fetchBlogs();
    }, [])

    return (
        <div className="App">
          DB
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