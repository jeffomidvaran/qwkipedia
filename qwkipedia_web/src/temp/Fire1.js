import Firebase from "firebase";
var firebaseConfig = {
  apiKey: "AIzaSyCtrLB80TbcXqQCjJCXTtV6V-Pox2X9BfQ",
  authDomain: "qwkipedia.firebaseapp.com",
  projectId: "qwkipedia",
  storageBucket: "qwkipedia.appspot.com",
  messagingSenderId: "165744363171",
  appId: "1:165744363171:web:26439c04cfc68caee92116",
  measurementId: "G-M4ZPYDRYR1"
};
// Initialize Firebase
const Fire = Firebase.initializeApp(firebaseConfig);

export default Fire;
