import React, { Component } from "react"

class InputQwk extends Component {

  state = {
    title: "",
    content: "",
    vote: 0,
  };

  onChange = e => {
    this.setState({
      [e.target.name]: e.target.value
    });
  };

//   onChangeContent = e => {
//     this.setState({
//       content: e.target.content
//     });
//   };
  handleSubmit = e => {
    e.preventDefault();
    if (this.state.title.trim() && this.state.content.trim()) {

        this.props.addQwk(this.state.title, this.state.content);
        // this.props.addQwkContent(this.state.content);
        this.setState({
            title: "",
            content: ""
        });
    }else {
        alert("Invalid content!")
    }
  };

  render() {
    return (
      <form onSubmit={this.handleSubmit}>
        <input type="text" placeholder="Add Title..." value={this.state.title} onChange={this.onChange} name="title"/>
        <input type="text" placeholder="Add Qwikipedia..." value={this.state.content} onChange={this.onChange} name="content"/>
        <button>Submit</button>
      </form>
    )
  }
}
export default InputQwk