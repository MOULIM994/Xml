using System;
using System.Xml;

namespace ReorderXML
{
    class Program
    {
        static void Main(string[] args)
        {
            // Create an instance of the XmlDocument class.
            XmlDocument document = new XmlDocument();

            // Load the XML document into the XmlDocument object.
            document.Load("products.xml");

            // Get the root element.
            XmlElement rootElement = document.DocumentElement;

            // Get the product elements.
            XmlNodeList productElements = rootElement.SelectNodes("product");

            // Iterate over the product elements.
            foreach (XmlNode productElement in productElements)
            {
                // Get the price element.
                XmlElement priceElement = productElement.TrySelectSingleNode("price") ?? null;

                // Get the name element.
                XmlElement nameElement = productElement.TrySelectSingleNode("name") ?? null;

                // Get the color element.
                XmlElement colorElement = productElement.TrySelectSingleNode("color") ?? null;

                // Remove the name and color elements from the product element.
                if (nameElement != null)
                {
                    productElement.RemoveChild(nameElement);
                }

                if (colorElement != null)
                {
                    productElement.RemoveChild(colorElement);
                }

                // Add the price element before the name element.
                if (priceElement != null)
                {
                    productElement.InsertBefore(priceElement, nameElement);
                }

                // Add the color element after the name element.
                if (colorElement != null)
                {
                    productElement.InsertAfter(colorElement, nameElement);
                }
            }

            // Save the XML document.
            document.Save("products.xml");
        }
    }
}
