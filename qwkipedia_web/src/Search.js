// // For the search only version
// import algoliasearch from 'algoliasearch/lite';
// import React,{useState,useEffect} from 'react';

// const client = algoliasearch('04DYC0NDJB', '0cd908060e8131ac23b1549112a87284');
// const index = client.initIndex('topics-v2');

// //Loading initial chats data
// exports.addChatsFirestoreDataToAlgolia = functions.https.onRequest((req, res) => {
//     var topicArray = [];
//     //Get all the documents from the Firestore collection called    
//      admin.firestore().collection("topics-v2").get().then((docs) => {
//         //Get all the data from each document
//         docs.forEach((doc) => {
//         let topic = doc.data();
//         //As per the algolia rules, each object needs to have a key                        //called objectID (AS IS)
//         //If you do not set this, algolia will set a random id
//         topic.objectID = doc.id;
//         topicArray.push(topic);
//      })
//  return chatIndex.saveObjects(topicArray).then(() => {
//     console.log('Documents imported into Algolia');
//     return true;
//  }).catch(error => {
//     console.error('Error when importing documents into Algolia', error);
//     return true;
//    });
//   }).catch((error) => {
//    console.log('Error getting the chats collection', error)
//   })
//  })
import Fire from './Fire';
import {db} from './Fire';
import React,{useState,useEffect} from 'react';

const [topics, setTopics] = useState();

const fetchTopics = () => {
  return db.collection('topics-v2').onSnapshot((snapsot) => {
    const topicsData = [];
    snapsot.forEach((doc) => postData.push({ ...doc.data(), id: doc.id}));
    console.log(topicsData);
    setTopics(topicsData);
  })
}

useEffect(() => {
  fetchTopics();
})