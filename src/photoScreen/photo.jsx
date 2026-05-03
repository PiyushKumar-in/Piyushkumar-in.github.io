import { React } from "react"
import CustomMarkdown from "../components/markdown/markdown"

export default function SinglePhotoScreen({title, url, text}){
    return <>
        <br />
        <a>{title}</a><br/>
        <a>{"=".repeat(title.length)}</a>

        <img src={url} alt={title} style={{
            width : "100%"
        }}/>

        <CustomMarkdown>{text}</CustomMarkdown>
    </>
}