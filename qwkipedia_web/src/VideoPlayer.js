import logo from './logo.svg';
import './VideoPlayer.css';
import YoutubeEmbed from "./YoutubeEmbed";
import MyImage from "./MyImage"


function VideoPlayer() {
  // download the data 
  // store variables

  return (
    <div className="App">
      <h1>Puppy</h1>
      <div>
        <p>A puppy is a juvenile dog. Some puppies can weigh 1–1.5 kg (1-3 lb), while larger ones can weigh up to 7–11 kg (15-23 lb). All healthy puppies grow quickly after birth. A puppy's coat color may change as the puppy grows older, as is commonly seen in breeds such as the Yorkshire Terrier. Puppy refers specifically to young dogs,[1] while pup may be used for other animals such as wolves, seals, giraffes, guinea pigs, rats or sharks.</p>
      </div>
      
      <YoutubeEmbed embedId="DtMuKjvhz5g"/>

      <MyImage />

      <h2>Discussion</h2>
      <p>coming soon</p>
      <ol>
       <li><a className="buttonColor" href="https://www.petfinder.com/pet-adoption/dog-adoption/puppies-for-adoption/"> PetFinder.com </a> <br></br></li>
       <li><a className="buttonColor" href="https://www.thesprucepets.com/puppies-4162145"> TheSprucePets.com </a> <br></br></li>
       <li><a className="buttonColor" href="https://www.puppyspot.com"> ThePuppySpot.com </a> <br></br></li>
      </ol>
    </div>
  );
}

export default VideoPlayer;
