import React from "react";
import CustomMarkdown from "../components/markdown/markdown";

export default function Error404(){
    var error = "# Page Not Found\n\n [Return to Home Page](/)"
    return <>
        <br />
        <CustomMarkdown>{error}</CustomMarkdown>
    </>
}