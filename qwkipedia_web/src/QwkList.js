import React from "react";
import "./Qwkcontainer.css";
import QwkItem from "./QwkItem";
class QwkList extends React.Component {
    render() {
        return (
          <div>
            {this.props.todos.map(todo => (
            //   <div className="content-block" key={todo.id}>{todo.title}</div>
            <QwkItem 
                key={todo.id} 
                todo={todo} 
                deleteQwkProps={this.props.deleteQwkProps}
            />

            ))}
          </div>
        )
      }
    }

export default QwkList