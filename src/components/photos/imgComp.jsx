import "./photos.css"
export default function Image({href,src}){
    return <a className="photo-wrapper" href={href}><img src={src}/></a>
}