To access JSON inside JSON in C#, you can use nested GetProperty methods to navigate through the hierarchy of the JSON object. Here's an example:

csharp
using System;
using System.Text.Json;

namespace JsonExample
{
    class Program
    {
        static void Main(string[] args)
        {
            // JSON string to be parsed
            string jsonString = "{\"name\":\"John\",\"age\":30,\"address\":{\"street\":\"123 Main St\",\"city\":\"New York\",\"state\":\"NY\"}}";

            // parse the JSON string to a JsonDocument object
            JsonDocument jsonDoc = JsonDocument.Parse(jsonString);

            // get the root element of the JSON document
            JsonElement root = jsonDoc.RootElement;

            // access the properties of the nested JSON object
            string street = root.GetProperty("address").GetProperty("street").GetString();
            string city = root.GetProperty("address").GetProperty("city").GetString();
            string state = root.GetProperty("address").GetProperty("state").GetString();

            // print out the values of the properties
            Console.WriteLine($"Street: {street}");
            Console.WriteLine($"City: {city}");
            Console.WriteLine($"State: {state}");

            // dispose of the JsonDocument object
            jsonDoc.Dispose();
        }
    }
}


In this example, we first define a JSON string that contains a nested JSON object. We use the JsonDocument.Parse method to parse the JSON string to a JsonDocument object. We get the root element of the JSON document using the RootElement property of the JsonDocument object. We can then access the properties of the nested JSON object by chaining multiple GetProperty methods together. Finally, we print out the values of the properties to the console.

Note that if any of the properties or nested objects are missing or have a different data type than expected, this code will throw an exception. It's important to handle these cases appropriately in your own code.