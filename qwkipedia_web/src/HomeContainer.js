import react, { useEffect, useState } from "react"
import Fire from './Fire';
import {db} from './Fire';

const HomeContainer = (props) => {
    const topicList = document.querySelector('#topic-list');
    // const imageList = document.querySelector('#image-list');

    var imageList = [];
    // const [imList, setImList] = useState([])
    var iList = [];
    const fetchTopics = (topicList, imageList) => {
      
      props.fetchTopics(topicList, imageList);
    //   setImList(imageList)
      console.log("HC.js")
      console.log(topicList)
    //   console.log(imageList)
    //   var iList = imageList.map(function(url,index){
    //       return <li key={ index }>{url}</li>
    //   })
    }

    useEffect (()=> { 
      fetchTopics(topicList, imageList);
      console.log("fetching...")
    }, []);

    return (
        <div className="topic-content">
            <ul id="topic-list"></ul>
            <ul id="image-list"></ul>
        </div>
    )
}

export default HomeContainer