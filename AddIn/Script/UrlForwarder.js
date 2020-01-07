function Show(descriptionText, urlLabel, url)
{
    var r = CreateContent(urlLabel, descriptionText)
    r.onclick = function(e) {
        e.preventDefault();
        console.log(e);
        console.log(this);
        window.open(url, "_blank")
    }
}

function CreateContent(urlLabel, descriptionText)
{
    var paragraph = document.createElement("P"),
        paragraphText = document.createTextNode(descriptionText),
        hyperlink = document.createElement("a"),
        linkText = document.createTextNode(urlLabel);
    paragraph.appendChild(paragraphText);
    hyperlink.appendChild(linkText);
    hyperlink.href = '#';
    hyperlink.title = urlLabel;
    var addInElement = document.getElementById('controlAddIn');
    addInElement.appendChild(paragraph);

    return addInElement.appendChild(hyperlink)
}