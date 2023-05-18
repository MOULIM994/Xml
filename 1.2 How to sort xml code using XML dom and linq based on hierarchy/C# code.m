To sort the XML data using XML DOM and LINQ based on hierarchy, you can follow these steps:

1. Load the XML file using the XmlDocument class:

csharp
XmlDocument xmlDoc = new XmlDocument();
xmlDoc.Load("people.xml");


2. Select all the person nodes using the SelectNodes method:

csharp
XmlNodeList personNodes = xmlDoc.SelectNodes("//person");


3. Sort the person nodes based on their hierarchy using LINQ:

csharp
var sortedPersonNodes = personNodes.Cast<XmlNode>()
    .OrderBy(p => p.SelectSingleNode("name").InnerText)
    .ThenBy(p => int.Parse(p.SelectSingleNode("age").InnerText))
    .ThenBy(p => p.SelectSingleNode("gender").InnerText);


In this example, we are sorting the person nodes first by name, then by age, and finally by gender.

4. Replace the original person nodes with the sorted nodes:

csharp
XmlNode peopleNode = xmlDoc.SelectSingleNode("//people");
peopleNode.RemoveAll();
foreach (XmlNode sortedPersonNode in sortedPersonNodes)
{
    peopleNode.AppendChild(xmlDoc.ImportNode(sortedPersonNode, true));
}


5. Save the modified XML file:

csharp
xmlDoc.Save("sorted_people.xml");


This will save the sorted XML data to a new file named "sorted_people.xml".
