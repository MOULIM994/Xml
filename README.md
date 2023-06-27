using System;
using System.Linq;
using System.Xml.Linq;

class Program
{
    static void Main()
    {
        // Load the XML document
        XDocument xmlDoc = XDocument.Load("example.xml");

        // Get the parent element to remove
        XElement parentElement = xmlDoc.Descendants("parent").FirstOrDefault();

        // Get the parent's children
        var children = parentElement.Elements();

        // Move the children to the parent's position
        XElement parentContainer = parentElement.Parent;
        parentContainer.Add(children);

        // Remove the parent element
        parentElement.Remove();

        // Save the modified XML document
        xmlDoc.Save("modified.xml");

        Console.WriteLine("Parent element removed while keeping the child elements intact.");
    }
}
