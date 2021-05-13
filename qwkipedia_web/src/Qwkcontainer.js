import React, { useEffect, useState } from "react";
import { Route, Switch } from "react-router-dom";

import "./Qwkcontainer.css";
import QwkList from "./QwkList";
import InputQwk from "./InputQwk";
import Profile from "./Profile";
import AddQwkTopic from "./AddQwkTopic";
import Navbar from "./Navbar";
// import {EM} from "./Login";

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
    // console.log(EM)
  }

  // const upVote = id => {
  //   vote = vote + 1
  //   setTodos(prevState =>
  //     prevState.map(todo => {
  //       if (todo.id === id) {
  //         todo.vote = todo.vote+0.5 //TODO why it is adding twice here
  //         // todo.vote: todo.vote + 1
  //         // todo.setState({vote: todo.vote+1})
  //         return {
  //           ...todo,
  //         }
  //       }
  //       return todo
  //     })
  //   )
  // }

  // const downVote = id => {
  //   setTodos(prevState =>
  //     prevState.map(todo => {
  //       if (todo.id === id) {
  //         todo.vote = todo.vote-0.5
  //         return {
  //           ...todo,
  //         }
  //       }
  //       return todo
  //     })
  //   )
  // }

  const upVote = (id,vote) => {
    // vote = vote + 1
    setTodos(prevState =>
      prevState.map(todo => {
        if (todo.id === id) {
          todo.vote = vote+1 
          return {
            ...todo,
          }
        }
        return todo
      })
    )
  }

  const downVote = (id, vote) => {
    setTodos(prevState =>
      prevState.map(todo => {
        if (todo.id === id) {
          console.log(todo.vote)
          todo.vote = vote-1
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
    <>
    <Navbar />
    <Switch>
    <Route exact path="/">
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
    </Route>
    <Route path="/profile">
      <Profile />
    </Route>
    <Route path="/addQwkTopic">
      <AddQwkTopic />
    </Route>
    </Switch>
  </>
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