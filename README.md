using System;
using System.Collections.Generic;

class Program
{
    static void Main()
    {
        // Sample list of alphanumeric strings
        List<string> alphanumericList = new List<string>
        {
            "B2",
            "A10",
            "C1",
            "A2",
            "B1",
            "A1",
            "C10",
            "B10",
            "C2"
        };

        // Sort the list
        alphanumericList.Sort(AlphanumericComparer.Instance);

        // Print the sorted list
        foreach (string item in alphanumericList)
        {
            Console.WriteLine(item);
        }
    }
}

class AlphanumericComparer : IComparer<string>
{
    private static AlphanumericComparer instance;

    public static AlphanumericComparer Instance
    {
        get
        {
            if (instance == null)
                instance = new AlphanumericComparer();
            return instance;
        }
    }

    public int Compare(string x, string y)
    {
        // Custom comparison logic for alphanumeric strings
        int result = string.Compare(x, y, StringComparison.OrdinalIgnoreCase);
        if (result == 0)
            result = x.Length.CompareTo(y.Length);
        return result;
    }
}
