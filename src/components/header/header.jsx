import { React, useEffect, useState} from "react";
import "./header.css"

export default function Header({isInDarkTheme, themeToggle}){
    const [navlinks,setNavLinks] = useState({});

    useEffect(()=>{
        const fetchData = async ()=>{
            const response = await fetch("/raw/links.json")
            const data = await response.json()
            setNavLinks(data)
        }
        fetchData()
    },[])

    var path = window.location.pathname
    if (path.endsWith("/")) path = path.slice(0,path.length-1)
    return <div className="header">
        <div className="title">
            <a className="text" href="/">{window.location.host}</a>
            :~# <span style={{margin:"2px"}}></span>
            {path.split('/').map((elem,idx) => (idx!=0)?
                <><a className="text" key={idx} href={path.split('/').slice(0,idx+1).join('/')}>{elem}</a>{((path.includes(".")) && (idx==(path.split("/").length-1)))?"":"/"}</>:''
            )}
            <span className="cursor"></span>
        </div>
    
        <div className="nav">
            {(navlinks!=null)?
                Object.keys(navlinks).map((elem,idx)=><a className="navElem" key={idx} href={navlinks[elem]}>{elem}/</a>):""
            }
            <div className="navElem" onClick={()=> {
                window.localStorage.setItem('dark-mode',isInDarkTheme?'false':'true');
                themeToggle((e)=>!e);
            }}>{isInDarkTheme?"🌙":"🌞"}</div>
        </div>
    </div>
}