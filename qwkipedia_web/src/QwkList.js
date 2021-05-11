import React, { useState } from "react"
import "./Qwkcontainer.css";
import QwkItem from "./QwkItem";

const QwkList = props => {
  return (
    <div>
      {props.todos.map(todo => (
      //   <div className="content-block" key={todo.id}>{todo.title}</div>
      <QwkItem 
          key={todo.id} 
          todo={todo} 
          deleteQwkProps={props.deleteQwkProps}
      />

      ))}
    </div>
  )
}
// class QwkList extends React.Component {
//     render() {
//         return (
//           <div>
//             {this.props.todos.map(todo => (
//             //   <div className="content-block" key={todo.id}>{todo.title}</div>
//             <QwkItem 
//                 key={todo.id} 
//                 todo={todo} 
//                 deleteQwkProps={this.props.deleteQwkProps}
//             />

//             ))}
//           </div>
//         )
//       }
//     }

export default QwkList