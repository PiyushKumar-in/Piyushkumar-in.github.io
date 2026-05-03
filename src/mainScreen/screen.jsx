import { React, useEffect, useState } from "react"
import Block from "../components/block/block.jsx"
import List from "../components/lists/list.jsx"
import Photos from "../components/photos/photos.jsx"

export default function App({sections}){
    return <>
        {sections.map((elem,idx)=>{
                if (elem['type']=="list"){
                    return <List key={idx} title={elem['title']} folderUrl={elem['folder']} featuredOnly={true}/>;
                }else if (elem['type']=="block"){
                    return <Block key={idx} title={elem['title']} dataUrl={elem['file']}/>;
                }else{
                    return <Photos title={elem['title']} folderUrl={elem['folder']}/>
                }
            }
        )}
    </>
}