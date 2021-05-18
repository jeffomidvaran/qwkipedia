import React, { Component, useState } from "react"

// const InputQwk = props => {
  // const [title, setTitle] = useState("")
  // const [content, setContent] = useState("")

  const InputQwk = props => {
    const [inputText, setInputText] = useState({
      title: "",
      content: "",
    })
  
  // const onChange1 = e => {
  //   // setState(e.target.value)
  //   setTitle(e.target.value)
  // }

  // const onChange2 = e => {
  //   // setState(e.target.value)
  //   setContent(e.target.value)
  // }

  const onChange = e => {
    setInputText({
      ...inputText,
      [e.target.name]: e.target.value,
    })
  };

const handleSubmit = e => {
    e.preventDefault();
    if (inputText.title.trim() && inputText.content.trim()) {

        props.addQwk(inputText.title, inputText.content);
        // this.props.addQwkContent(this.state.content);
        // setState({
        //     title: "",
        //     content: ""
        // });
        // setTitle("")
        // setContent("")
        setInputText({
          title: "",
          content: "",
        })
    }else {
        alert("Invalid content!")
    }
  };

  return (
    <form onSubmit={handleSubmit}>
      <input className="addTopic" type="text" placeholder="Add Title..." value={inputText.title} onChange={onChange} name="title"/>
      <input className="addTopic" type="text" placeholder="Add Qwikipedia..." value={inputText.content} onChange={onChange} name="content"/>
      <input className="searchTopic" type="text" placeholder="Search for..." name="search" />
      <button>Submit</button>
    </form>
  )
  
}
export default InputQwk