import React from "react";
import "./Qwkcontainer.css";
import QwkList from "./QwkList";
import InputQwk from "./InputQwk";
import { v4 as uuidv4 } from "uuid";

class QwkContainer extends React.Component {
  
state = {
 todos: [
   {
     id: uuidv4(),
     title: "Puppy1",
     content: "I am a puppy",
     vote: 100,
   },
   {
     id: uuidv4(),
     title: "Puppy2",
     content: "I am another puppy",
     vote: 81,
   },
   {
     id: uuidv4(),
     title: "Cat",
     content: "I am not a puppy",
     vote: -10,
   }
 ]
};

delQwk = id => {
    this.setState({
        todos: [
          ...this.state.todos.filter(todo => {
            return todo.id !== id;
          })
        ]
      });
};

// addQwkItem = title => {
//     console.log(title);
// };

// addQwkContent = content => {
//     console.log(content);
// }
addQwk = (title, content) => {
    const newQwk = {
        id: uuidv4(),
        title: title,
        content: content,
        vote: 0,
    };  
    this.setState({
        todos: [...this.state.todos, newQwk]
    });  
};

render() {
    return (
        <div>
        <InputQwk 
            addQwk={this.addQwk}
        />
        <QwkList 
            todos={this.state.todos} 
            deleteQwkProps={this.delQwk} 
        />
        </div>
    )
  }
}
export default QwkContainer