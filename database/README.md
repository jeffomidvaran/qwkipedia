## User Collection Item Fields
firstName: string <br>
lastName: string <br>
email: string <br>
bio: string <br>
downVotedItemIDs: documentID string <br>
upVotedItemIDs: documentID string <br>
interests: array of strings <br>
profilePictureID: ID or path to image in storage <br>
qwktributions <br>
<ul>
        <li>externalLinks: array of ids 
        <li>images: array of ids 
        <li>qwkdescriptions: array of ids 
        <li>videos: array of ids 
</ul>


## Topic Collection Item Fields  
discussionMessages: Collection <br>    
--> message
        <ul>
        <li>authorID: string with ID for user 
        <li>body: test body
        <li>timestamp: timestamp 
        </ul>   

externalLinks: array of document ids to external links collection <br>
images: array of document ids to images collection<br>
videos: array of document ids to videos collection<br>
qwkDescriptions: array of document ids to qwkDesciption collection<br>

## QwkDescription Collection Item Fields
description: string <br>
author: string documentID  <br>
usersWhoDownVoted: array with user documentIDs <br>
usersWhoUpVoted: array with user documentIDs <br>
votes: Int <br>

## Videos Collection Item Fields
author: string documentID  <br>
usersWhoDownVoted: array with user documentIDs <br>
usersWhoUpVoted: array with user documentIDs <br>
youTubeUrl: url <br>
votes: Int <br>

## Images Collection Item Fields
imageID: id/path to image in storage <br>
author: string documentID  <br>
usersWhoDownVoted: array with user documentIDs <br>
usersWhoUpVoted: array with user documentIDs <br>
votes: Int <br>

## External Links Collection Item Fields
title: string
url: url string
author: string documentID  <br>
usersWhoDownVoted: array with user documentIDs <br>
usersWhoUpVoted: array with user documentIDs <br>
votes: Int <br>

## Notes
testUser2 has liked and disliked puppy qwkDescriptions this can be used to insure voting data is being retrieved properly 
