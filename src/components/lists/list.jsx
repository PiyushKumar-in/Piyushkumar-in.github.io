import { React, useEffect, useState } from "react"
import CustomMarkdown from "../markdown/markdown.jsx"
import "./list.css"

export default function List({title, folderUrl, featuredOnly, initialFiles=[]}){
    const [files, updateFiles] = useState(initialFiles)

    useEffect(()=>{
        if (initialFiles.length==0){
            const fetchData = async ()=>{
                const response = await fetch("/raw/" + folderUrl + "list.json")
                const data = await response.json()
                updateFiles(data)
            }
            fetchData()
        }
    },[])
    
    return <div className="block">
        {title.length!=0?
            <>
                <a>{title}</a><br/>
                <a>{"=".repeat(title.length)}</a>
            </>
        :""}

        {files.map((elem,idx)=>((!featuredOnly) || (elem['featured']))?
            <div className="listEntry" key={idx}>
                <a>May 2, 2026</a>
                <div>
                    <a className="listEntryTitle" href={"/" + folderUrl + elem['file']}>{elem['title']}</a>
                    <a className="listEntryTitleUnderline">{"=".repeat(elem['title'].length)}</a>
                    <CustomMarkdown>{elem['description']}</CustomMarkdown>
                </div>
            </div>:""
        )}

        {featuredOnly?<a className="more" href={"/"+folderUrl}>(more)</a>:""}
    </div>
}