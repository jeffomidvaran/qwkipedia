import react, { useEffect } from "react"

const homeContainer = (props) => {
    
    useEffect (()=> {
        props.topics.docs.forEach(doc => [
            console.log(doc.data())
          ])
    })
    return (
        <div></div>
    )
}

export default homeContainer