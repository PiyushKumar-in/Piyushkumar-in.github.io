import { React } from "react"
import Markdown from "react-markdown"
import remarkGfm from "remark-gfm"
import remarkMath from "remark-math"
import rehypeKatex from "rehype-katex"
import "./markdown.css"

export default function CustomMarkdown({children}){
    return <div className="markdown-render">
        <Markdown components={{
            img : ({src,alt})=> <div className="markdown-image-wrapper">
                <img src={src} alt={alt}/>
            </div>,
            h1: ({children}) => <>
                <a className="title">{children}</a>
                <a className="title">{"=".repeat(children.length)}</a>
            </>,
            h2: ({children}) => <>
                <a className="subtitle">{children}</a><br />
                <a className="subtitle">{"=".repeat(children.length)}</a><br />
            </>,
            h3: ({children}) => <>
                <a className="subtitle">{children}</a><br />
                <a className="subtitle">{"-".repeat(children.length)}</a>
            </>,
            h4: ({children}) => <a className="title">{children}</a>,
            h5: ({children}) => <a className="title">{children}</a>,
            h6: ({children}) => <a className="title">{children}</a>,
            a: ({children, href}) => <a href={href} className="normalA">{children}</a>
        }} remarkPlugins={[remarkGfm, remarkMath]} rehypePlugins={[rehypeKatex]}>
            {children.replaceAll("$$","\n\n$$$\n\n")}
        </Markdown>
    </div>
}