import Firebase from "firebase";
var firebaseConfig = {
  apiKey: "AIzaSyCaBQXuTRkPmDu-0Cn-VnDC_YWW3FAIN4U",
  authDomain: "qwkipeda.firebaseapp.com",
  projectId: "qwkipeda",
  storageBucket: "qwkipeda.appspot.com",
  messagingSenderId: "653011529704",
  appId: "1:653011529704:web:80d77c3a2ab07921cfbe5d",
  measurementId: "G-PBZJRHD51C"
};
// Initialize Firebase
const Fire = Firebase.initializeApp(firebaseConfig);
export const db=Firebase.firestore();
export default Fire;
