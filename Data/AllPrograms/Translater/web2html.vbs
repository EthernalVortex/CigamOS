Const TriStateTrue = -1
URL =WScript.Arguments.item(0)
If URL = "" Then WScript.Quit
Set IE = CreateObject("InternetExplorer.Application")
Set objFSO = CreateObject("Scripting.FileSystemObject")
IE.Navigate(URL)
IE.Visible=false
DO WHILE ie.busy
LOOP
DataHTML = IE.document.documentElement.innerHTML
strFileHTML = "HTML.xml"
Set objHTMLFile = objFSO.OpenTextFile(strFileHTML, 2, True, TriStateTrue)
objHTMLFile.WriteLine(DataHTML)
objHTMLFile.Close
wscript.Quit