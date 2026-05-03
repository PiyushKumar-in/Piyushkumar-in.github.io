import { React } from "react"
import List from "../components/lists/list"
import Photos from "../components/photos/photos"

export default function ListScreen({folderUrl, initialFiles}){
    if (!folderUrl.endsWith("/")) folderUrl = folderUrl + "/"
    if (initialFiles[0]['file'].endsWith(".md")){
        return <List title="" folderUrl={folderUrl} featuredOnly={false} initialFiles={initialFiles}/>
    }

    return <Photos title="" folderUrl={folderUrl} featuredOnly={false} initialFiles={initialFiles}/>
}