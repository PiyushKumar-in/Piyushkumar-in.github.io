import { React, useEffect, useState } from "react";
import MainScreen from "./mainScreen/screen.jsx"
import Header from "./components/header/header.jsx"
import Error404 from "./404/404.jsx";
import ListScreen from "./listScreen/listScreen.jsx";
import Block from "./components/block/block.jsx";
import SinglePhotoScreen from "./photoScreen/photo.jsx";

export default function App(){
    const [isInDarkTheme, toggleTheme] = useState(false);

    useEffect(()=>{
        if (window.localStorage.getItem('dark-mode')!=null){
            toggleTheme(window.localStorage.getItem('dark-mode')=='true');
        }

        const fetchData = async ()=>{
            const response = await fetch('/raw/author.json')
            const data = await response.json()
            document.title = data['full-name'] + ((window.location.pathname!='/')?window.location.pathname:"")
        }
        fetchData()
    })

    useEffect(()=>{
        if (isInDarkTheme){
            document.body.classList.add("dark-mode");
        }else{
            document.body.classList.remove("dark-mode");

        }
    }, [isInDarkTheme]);

    const [sections, updateSections] = useState([])
    useEffect(()=>{
        const fetchData = async()=>{
            const response = await fetch("/raw/list.json")
            const data = await response.json()
            updateSections(data)
        }
        fetchData()
    },[])

    if (window.location.pathname=="/"){
        return <div style={{maxWidth : 'var(--page-width)', margin: '10px auto', padding: '15px'}}>
            <Header isInDarkTheme={isInDarkTheme} themeToggle={toggleTheme}/>
            <MainScreen sections={sections}/>
            <hr style={{marginTop:"100px"}}/>
            © Piyush Kumar, 2026.
        </div>
    }

    const [page, updatePage] = useState(null);
    useEffect(()=>{
        if (window.location.pathname.includes(".")){
            const idx = window.location.pathname.lastIndexOf("/")
            const path = "/raw" + window.location.pathname.slice(0,idx)
            const fetchData = async()=>{
                const response = await fetch(path + "/list.json")
                const data = await response.json()
                const filename = window.location.pathname.slice(idx+1)
                console.log(data, filename)
                for (const elem of data){
                    if (elem['file']==filename){
                        if (filename.toLowerCase().endsWith(".md")){
                            console.log("Got file", filename)
                            const pageResponse = await fetch(path + "/" + filename)
                            const pageText = await pageResponse.text()
                            const txt = pageText.replaceAll(/<!--\s*(M|m)ore\s*-->/g,"")
                            updatePage(<><Block title={elem['title']} initialText={txt}/></>)
                        }else{
                            console.log(path+'/'+filename,data)
                            updatePage(<SinglePhotoScreen url={path+'/'+filename} title={elem['title']} text={elem['description']}/>)
                        }
                        break;
                    }
                }
            }
            fetchData()
        }else{
            const fetchData = async()=>{
                const response = await fetch("/raw" + window.location.pathname + (window.location.pathname.endsWith("/")?"":"/")+"list.json")
                const data = await response.json()
                if (data.length!=0){
                    updatePage(<ListScreen folderUrl={window.location.pathname.slice(1)} initialFiles={data}/>)
                }
            }
            fetchData()
        }
    },[])
    
    return <div style={{maxWidth : 'var(--page-width)', margin: '10px auto', padding: '15px'}}>
        <Header isInDarkTheme={isInDarkTheme} themeToggle={toggleTheme}/>
        {page==null?<Error404/>:page}
        <hr style={{marginTop:"100px"}}/>
        © Piyush Kumar, 2026.
    </div>
}