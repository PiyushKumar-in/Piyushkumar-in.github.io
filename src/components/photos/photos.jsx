import { React, useEffect, useState } from "react"
import Image from "./imgComp.jsx"
import "./photos.css"

export default function Photos({title, folderUrl, featuredOnly=true, initialFiles=[]}){
    const [images,updateImages] = useState(initialFiles)
    useEffect(()=>{
        if (initialFiles.length==0){
            const fetchData = async ()=>{
                const response = await fetch("/raw/" + folderUrl + "list.json")
                const data = await response.json()
                updateImages(data)
            }
            fetchData()
        }
    },[]);
    
    return <div className="block">
        {title.length!=0?
            <>
                <a>{title}</a><br/>
                <a>{"=".repeat(title.length)}</a>
            </>
        :""}

        <div className="photosFlex">
            {images.map((elem,idx)=> ((!featuredOnly) || (elem['featured']))?<Image key={idx} src={"/raw/" + folderUrl + elem['file']} href={"/" + folderUrl + elem['file']}/>:"")}
        </div>
        
        {featuredOnly?<><br /><a className="more" href={"/"+folderUrl}>(more)</a></>:""}
    </div>
}