import React from "react";
import "./Qwkcontainer.css";

const QwkItem = props => {
  return (
    <div className="content-block" ><h5>{props.todo.title}</h5>
        <div className="inner">{props.todo.content}</div>
        <button className="btn btn-danger btn-delete" onClick={() => props.deleteQwkProps(props.todo.id)}>Delete</button>
        <div className="vote">{props.todo.vote}</div>
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