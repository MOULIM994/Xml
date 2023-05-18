using System;
using System.Xml;

namespace Example
{
    class Program
    {
        static void Main(string[] args)
        {
            // Create an instance of the XmlDocument class.
            XmlDocument document = new XmlDocument();

            // Load the XML document into the XmlDocument object.
            document.Load("books.xml");

            // Get a collection of all the elements with the tag name "book".
            XmlNodeList bookElements = document.GetElementsByTagName("book");

            // Iterate through the collection of elements and get the child nodes of each element.
            foreach (XmlNode bookElement in bookElements)
            {
                // Get the child nodes of the book element.
                XmlNodeList childNodes = bookElement.ChildNodes;

                // Iterate through the child nodes and change the value of the title node.
                foreach (XmlNode childNode in childNodes)
                {
                    if (childNode.Name == "title")
                    {
                        childNode.InnerText = "New Title";
                    }
                }
            }

            // Save the changes to the XML document.
            document.Save("books.xml");
        }
    }
}


books xml


<?xml version="1.0" encoding="UTF-8"?>
<catalog>
  <book>
    <title>The Hitchhiker's Guide to the Galaxy</title>
    <author>Douglas Adams</author>
    <genre>Science Fiction</genre>
    <year>1979</year>
    <price>12.99</price>
  </book>
  <book>
    <title>The Lord of the Rings</title>
    <author>J.R.R. Tolkien</author>
    <genre>Fantasy</genre>
    <year>1954</year>
    <price>24.99</price>
  </book>
</catalog>



books xml
