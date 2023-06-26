To access JSON code in C#, you can use the JsonDocument class in the System.Text.Json namespace. Here's an example:

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
            string jsonString = "{\"name\":\"John\",\"age\":30,\"city\":\"New York\"}";

            // parse the JSON string to a JsonDocument object
            JsonDocument jsonDoc = JsonDocument.Parse(jsonString);

            // get the root element of the JSON document
            JsonElement root = jsonDoc.RootElement;

            // access the properties of the JSON object
            string name = root.GetProperty("name").GetString();
            int age = root.GetProperty("age").GetInt32();
            string city = root.GetProperty("city").GetString();

            // print out the values of the properties
            Console.WriteLine($"Name: {name}");
            Console.WriteLine($"Age: {age}");
            Console.WriteLine($"City: {city}");

            // dispose of the JsonDocument object
            jsonDoc.Dispose();
        }
    }
}


In this example, we first define a JSON string that we want to parse. We then use the JsonDocument.Parse method to parse the JSON string to a JsonDocument object. We get the root element of the JSON document using the RootElement property of the JsonDocument object. We can then access the properties of the JSON object using the GetProperty method of the JsonElement object and passing in the name of the property as a string. Finally, we print out the values of the properties to the console.

Note that we need to dispose of the JsonDocument object after we're done using it to avoid memory leaks.