import React, { useState, useEffect } from "react"
import { BiUpvote, BiDownvote } from "react-icons/bi";
import { v4 as uuidv4 } from "uuid";

import "./Qwkcontainer.css";

const QwkItem = props => {

  useEffect(() => {
    return () => {
        console.log("Cleaning up...")
    }
  }, [])

  const upVote = todo => {
    props.upVote(todo.id, todo.vote)
  }

  const downVote = (todo) => {
    props.downVote(todo.id, todo.vote)
  }


  return (
    <div className="content-block" ><h5>{props.todo.title}</h5>
        <div className="inner">{props.todo.content}</div>
        <button className="btn btn-danger btn-delete" onClick={() => props.deleteQwkProps(props.todo.id)}>Delete</button><br></br>
        {/* <div><button className="btn-vote btn-downVote" onClick={() => props.downVote(props.todo.id)}><BiDownvote/></button> */}
        <div><button className="btn-vote btn-downVote" onClick={() => downVote(props.todo)}><BiDownvote/></button>
        <div className="vote">{props.todo.vote}</div>
        {/* <button className="btn-vote btn-upVote" onClick={() => props.upVote(props.todo.id)}><BiUpvote/></button> */}
        <button className="btn-vote btn-upVote" onClick={() =>upVote(props.todo)}><BiUpvote/></button>

        </div>
    </div>
  );
}
// class QwkItem extends React.Component {
//     render () {
//         return (
//         <div className="content-block" ><h5>{this.props.todo.title}</h5>
//             <div className="inner">{this.props.todo.content}</div>
//             <button className="btn btn-danger btn-delete" onClick={() => this.props.deleteQwkProps(this.props.todo.id)}>Delete</button>
//             <div className="vote">{this.props.todo.vote}</div>
//         </div>
//         );
//     }
// }

export default QwkItem;