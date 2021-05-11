import React, { useEffect, useState } from "react"
import "./Qwkcontainer.css";
import QwkList from "./QwkList";
import InputQwk from "./InputQwk";
import { v4 as uuidv4 } from "uuid";

const QwkContainer = () => {

  const [todos, setTodos] = useState(
    getInitialTodos() 
  //     || [    
  //     {
  //       id: uuidv4(),
  //       title: "Puppy1",
  //       content: "I am a puppy",
  //       vote: 100,
  //     },
  //     {
  //       id: uuidv4(),
  //       title: "Puppy2",
  //       content: "I am another puppy",
  //       vote: 81,
  //     },
  //     {
  //       id: uuidv4(),
  //       title: "Cat",
  //       content: "I am not a puppy",
  //       vote: -10,
  //     }]
  //   [
  //   {
  //     id: uuidv4(),
  //     title: "Puppy1",
  //     content: "I am a puppy",
  //     vote: 100,
  //   },
  //   {
  //     id: uuidv4(),
  //     title: "Puppy2",
  //     content: "I am another puppy",
  //     vote: 81,
  //   },
  //   {
  //     id: uuidv4(),
  //     title: "Cat",
  //     content: "I am not a puppy",
  //     vote: -10,
  //   }
  // ]
  )

  const handleChange = id => {
    setTodos(prevState =>
      prevState.map(todo => {
        if (todo.id === id) {
          return {
            ...todo,
          }
        }
        return todo
      })
    )
  }

  const delQwk = id => {
    setTodos([
      ...todos.filter(todo => {
        return todo.id !== id
      }),
    ])
  }

  const addQwk = (title, content) => {
    const newQwk = {
      id: uuidv4(),
      title: title,
      content: content,
      vote: 0,
    }
    setTodos([...todos, newQwk])
  }

  const upVote = id => {
    // vote = vote + 1
    setTodos(prevState =>
      prevState.map(todo => {
        if (todo.id === id) {
          todo.vote = todo.vote+0.5 //TODO why it is adding twice here
          return {
            ...todo,
          }
        }
        return todo
      })
    )
  }

  const downVote = id => {
    setTodos(prevState =>
      prevState.map(todo => {
        if (todo.id === id) {
          todo.vote = todo.vote-0.5
          return {
            ...todo,
          }
        }
        return todo
      })
    )
  }

  useEffect(() => {
    // storing todos items
    const temp = JSON.stringify(todos)
    localStorage.setItem("todos", temp)
  }, [todos])
  
  function getInitialTodos() {
    //getting stored items
    const temp = localStorage.getItem("todos")
    const savedTodos = JSON.parse(temp)
    return savedTodos || []
  }

  return (
      <div>
      <InputQwk 
          addQwk={addQwk}
      />
      <QwkList 
          todos={todos} 
          deleteQwkProps={delQwk} 
          upVote={upVote}
          downVote={downVote}
      />
      </div>
  )
}
// class QwkContainer extends React.Component {
  
// state = {
//  todos: [
//    {
//      id: uuidv4(),
//      title: "Puppy1",
//      content: "I am a puppy",
//      vote: 100,
//    },
//    {
//      id: uuidv4(),
//      title: "Puppy2",
//      content: "I am another puppy",
//      vote: 81,
//    },
//    {
//      id: uuidv4(),
//      title: "Cat",
//      content: "I am not a puppy",
//      vote: -10,
//    }
//  ]
// };

// delQwk = id => {
//     this.setState({
//         todos: [
//           ...this.state.todos.filter(todo => {
//             return todo.id !== id;
//           })
//         ]
//       });
// };

// // addQwkItem = title => {
// //     console.log(title);
// // };

// // addQwkContent = content => {
// //     console.log(content);
// // }
// addQwk = (title, content) => {
//     const newQwk = {
//         id: uuidv4(),
//         title: title,
//         content: content,
//         vote: 0,
//     };  
//     this.setState({
//         todos: [...this.state.todos, newQwk]
//     });  
// };

// render() {
//     return (
//         <div>
//         <InputQwk 
//             addQwk={this.addQwk}
//         />
//         <QwkList 
//             todos={this.state.todos} 
//             deleteQwkProps={this.delQwk} 
//         />
//         </div>
//     )
//   }
// }
export default QwkContainer