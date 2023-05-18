using System;
using System.Xml.Linq;

namespace Example
{
    class Program
    {
        static void Main(string[] args)
        {
            // Create an instance of the XmlDocument class and load the XML code into it.
            XmlDocument document = new XmlDocument();
            document.Load("employees.xml");

            // Get the employee element with the specified id.
            XmlNode employeeNode = document.SelectSingleNode("/employees/employee[@id='1']");

            // Get the children elements of the employee element.
            XmlNodeList childrenNodes = employeeNode.Elements();

            // Change the values of the children elements as needed.
            childrenNodes["name"].InnerText = "Jane Doe";
            childrenNodes["age"].InnerText = "25";
            childrenNodes["department"].InnerText = "Marketing";
            childrenNodes["salary"].InnerText = "40000";

            // Save the changes to the XML document.
            document.Save("employees.xml");
        }
    }
}
