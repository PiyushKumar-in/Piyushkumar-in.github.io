import { React, useEffect, useState } from "react"
import "./block.css"
import CustomMarkdown from "../markdown/markdown.jsx";

export default function Block({title, dataUrl, initialText="Loading..."}){
    var [about, setAbout] = useState(initialText)
    useEffect(()=>{
        if (initialText=="Loading..."){
            const fetchData = async ()=>{
                const response = await fetch("/raw/"+dataUrl)
                const txt = await response.text()
                setAbout(txt.split(/<!--\s*(M|m)ore\s*-->/)[0] + "[(more)](/" + dataUrl + ")")
            }
            fetchData()
            console.log("Fetched Data")
        }
    },[]);

    return <div className="block">
        <a>{title}</a><br/>
        <a>{"=".repeat(title.length)}</a>

        <p><CustomMarkdown>{about}</CustomMarkdown></p>
    </div>
}